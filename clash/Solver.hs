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

  initialODEState = ODEState  { xs  = repeat 0 :: ValueVector
                              , t   = 0 
                            }
  initialSystemState = SystemState  { odestate = initialODEState
                                    , count = 0
                                    , substep = uIntMax
                                  }
  initialSystemConstants = SystemConstants  { maxtime = 125
                                            , timestep = 0.01
                                            , outputstep = 5
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
      
      i_keys = keys_input input
      --i_switches = switches_input
      i_oa = out_address input
      i_os = out_read input

      --Unpack the state
      s_odestate = odestate systemState
      s_substep = substep systemState
      s_count = count systemState

      s_valueVector = xs s_odestate 
      --s_timevalue = t s_odestate

      --Unpack the constants
      --c_maxtime = maxtime systemConstants
      --c_timestep = timestep systemConstants
      c_substep = outputstep systemConstants
      c_user = userconstants systemConstants

      -- Control signal
      -- addresses: 
      -- 0 <- status flags { 1 starts a round of computation, 2 resets the state, 3 resets the constants}
      -- 1 <- maximal computation time
      -- 2 <- time step
      -- 3 <- output step (how much output to generate)
      -- 4 <- Custom constants
      -- 5 <- Custom constants all the way down
      -- 6 <- etc.

      (systemState',oul',block')  | i_c == 2 && i_cs == 1 && i_ca == 0    = ( initialSystemState, 0, 0)   -- reset the state, no output, no block
                                  | i_is == 1                             = ( systemState{ odestate = s_odestate_in', count = s_count' }, pack s_count', block)   --allow direct inserts into registers
                                  | i_c == 1 && i_cs == 1 && i_ca == 0    = ( systemState{ substep = 0} , 0, 0)   -- trigger the computation (release the block)
                                  | block == 1 && i_os == 1               = ( systemState, pack (s_valueVector !! i_oa), block)
                                  | block == 0 && s_substep < c_substep   = ( systemState{ odestate = s_odestate_up', substep = s_substep'}, pack (t s_odestate_up'), block)  --execute 
                                  | block == 0 && s_substep >= c_substep  = ( systemState{ substep = uIntMax} , pack (t s_odestate), 1) --set the block
                                  | otherwise                             = ( systemState, oul, block)
                                  where
                                    s_count'        = s_count + 1
                                    s_odestate_in'  = s_odestate {xs = replace i_ia i_i_d s_valueVector}
                                    s_odestate_up'  = eulerScheme systemConstants matrix2d s_odestate
                                    s_substep'      = s_substep + 1
                                    i_i_d           = unpack i_i :: Data

      systemConstants'  | i_c == 3 && i_cs == 1 && i_ca == 0    = initialSystemConstants   -- reset the constants 
                        | i_cs == 1 && i_ca == 1                = systemConstants{ maxtime = i_c_d }
                        | i_cs == 1 && i_ca == 2                = systemConstants{ timestep = i_c_d }
                        | i_cs == 1 && i_ca == 3                = systemConstants{ outputstep = i_c_u }
                        | i_cs == 1 && i_ca >= 4                = systemConstants{ userconstants = c_user' }
                        | otherwise                             = systemConstants
                        where
                          c_user'   = replace i_ca (unpack i_c :: Data) c_user
                          i_c_d = unpack i_c :: Data
                          i_c_u = unpack i_c :: UInt

      --Set the output
      leds = complement i_keys
      output = OutputSignals {leds_status = leds, control_readdata = 0, out_readdata = oul'}



