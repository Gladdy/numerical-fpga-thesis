module Solver where

  import CLaSH.Prelude
  import SolverTypes
  import SolverSchemes
  import SolverEquations

  {-# ANN topEntity
    (defTop
      { t_name     =  "compute_main"

      , t_inputs   =  [ "keys_input"
                      , "switches_input"
                      , "control_write"
                      , "control_writedata"
                      , "control_address"
                      , "control_read"
                      , "in_write"
                      , "in_writedata"
                      , "in_address"
                      , "out_address"
                      , "out_read"
                      ]

      , t_outputs  =  [ "leds_status"
                      , "control_readdata"
                      , "out_readdata"
                      ]
      , t_extraIn  =  []
      , t_extraOut =  []
      , t_clocks =    []
      }
    ) 
    #-}

  initialODEState = ODEState  { valueVector = repeat 0 :: ValueVector
                              , time = 0 
                            }
  initialSystemState = SystemState  { odestate = initialODEState
                                    , step = uIntMax
                                  }
  initialSystemConstants = SystemConstants  { maxtime = 125
                                            , timestep = 0.01
                                            , maxstep = 5
                                            , userconstants = repeat 0 :: ConstantVector
                                          }
  
  initialState = (initialSystemState, initialSystemConstants, 0 :: BitVector 32, 1 :: Bit)


  topEntity :: Signal InputSignals -> Signal OutputSignals
  topEntity = mealy solveODE initialState

  solveODE (systemState,systemConstants,oul,block) input = ((systemState',systemConstants',oul',block'),output)
    where
      --Unpack the input
      i_c = control_writedata input
      i_ca = control_address input
      i_cs = control_write input

      i_i = in_writedata input
      i_ia = in_address input
      i_is = in_write input
      
      i_oa = out_address input
      i_os = out_read input

      --Unpack the state
      s_odestate = odestate systemState
      s_step = step systemState

      xs = valueVector s_odestate 
      t = time s_odestate

      --Unpack the constants
      c_maxstep = maxstep systemConstants
      c_user = userconstants systemConstants

      -- Control signal
      -- addresses: 
      -- 0  <- status flags { 1 starts a round of computation, 2 resets the state}
      -- 1  <- maximal computation time
      -- 2  <- time step
      -- 3  <- output step (how much output to generate)
      -- 4+ <- Custom constants
      
      (systemState',oul',block')  --Handle the setup (reset the state, enter a value into the input registers, start the computation)
                                  | i_c == 2 && i_cs == 1 && i_ca == 0  = ( initialSystemState, 0, 0)
                                  | i_is == 1                           = ( systemState{ odestate = s_odestate_in' }, 0, block)
                                  | i_c == 1 && i_cs == 1 && i_ca == 0  = ( systemState{ step = 0 } , 0, 0)

                                  --Handle the computation and output: 
                                  | block == 1 && i_os == 1             = ( systemState, pack (xs !! i_oa), block)
                                  | block == 0 && s_step < c_maxstep    = ( systemState{ odestate = s_odestate_up', step = s_step'}, 0, block)
                                  | block == 0 && s_step >= c_maxstep   = ( systemState{ step = uIntMax}, pack uIntMax, 1)

                                  --Default, do nothing
                                  | otherwise                           = ( systemState, oul, block)
                                  where
                                    s_odestate_in'  = s_odestate {valueVector = replace i_ia (unpack i_i :: Data) xs}
                                    s_odestate_up   = euler systemConstants matrix3d s_odestate
                                    s_odestate_up'  = s_odestate_up{valueVector = replace 15 (time s_odestate_up) (valueVector s_odestate_up)}
                                    s_step'         = s_step + 1

      systemConstants'  --Enter the constants into the ConstantVector
                        | i_cs == 1 && i_ca == 1  = systemConstants{ maxtime = i_c_d }
                        | i_cs == 1 && i_ca == 2  = systemConstants{ timestep = i_c_d }
                        | i_cs == 1 && i_ca == 3  = systemConstants{ maxstep = i_c_u }
                        | i_cs == 1 && i_ca >= 4  = systemConstants{ userconstants = c_user' }
                        | otherwise               = systemConstants
                        where
                          c_user' = replace i_ca (unpack i_c :: Data) c_user
                          i_c_d   = unpack i_c :: Data
                          i_c_u   = unpack i_c :: UInt

      --Set the output
      output = OutputSignals {leds_status = 0b1101 :: BitVector 4, control_readdata = 0, out_readdata = oul'}


