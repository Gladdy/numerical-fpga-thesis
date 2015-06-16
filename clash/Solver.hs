module Solver where

  import CLaSH.Prelude
  import SolverTypes

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
  initialSystemConstants = SystemConstants  { maxtime = 1000
                                            , timestep = 1
                                            , outputstep = 1
                                            , userconstants = repeat 0 :: ConstantVector
                                          }
  
  initialState = (initialSystemState, initialSystemConstants, 0 :: BitVector 32, 1 :: Bit)


  topEntity :: Signal InputSignals -> Signal OutputSignals
  topEntity = mealy forwardLEDS initialState

  forwardLEDS (systemState,systemConstants,oul,block) input = ((systemState',systemConstants',oul',block'),output)
    where
      --Unpack the input
      i_c = control_writedata input
      i_ca = control_address input
      i_cs = control_write input

      i_i = in_writedata input
      i_ia = in_address input
      i_is = in_write input
      
      i_keys = keys_input input
      i_oa = out_address input
      i_os = out_read input

      --Unpack the state
      s_odestate = odestate systemState
      s_substep = substep systemState
      s_count = count systemState

      s_valueVector = xs s_odestate 
      s_timevalue = t s_odestate

      --Unpack the constants
      c_maxtime = maxtime systemConstants
      c_timestep = timestep systemConstants
      c_substep = outputstep systemConstants
      c_user = userconstants systemConstants

      -- Control signal
      -- addresses: 
      -- 0 <- status flags { 1 starts a round of computation}
      -- 1 <- maximal computation time
      -- 2 <- time step
      -- 3 <- output step (how much output to generate)
      -- 4 <- Custom constants
      -- etc..

      (systemState',oul',block')  | i_is == 1                             = ( systemState{ odestate = s_odestate_in', count = s_count' }, pack s_count', block)   --allow direct inserts into registers
                                  | i_c == 1 && i_cs == 1 && i_ca == 0    = ( systemState{ substep = 0} , 0, 0)   -- trigger the computation (release the block)
                                  | block == 1 && i_os == 1               = ( systemState, pack (s_valueVector !! i_oa), block)
                                  | block == 0 && s_substep < c_substep   = ( systemState{ odestate = s_odestate_up', substep = s_substep'}, pack (t s_odestate_up'), block)  --execute 
                                  | block == 0 && s_substep >= c_substep  = ( systemState{ substep = uIntMax} , pack uIntMax, 1) --set the block
                                  | otherwise                             = ( systemState, oul, block)
                                  where
                                    s_count'        = s_count + 1
                                    s_odestate_in'  = s_odestate {xs = replace i_ia i_i_d s_valueVector}
                                    s_odestate_up'  = s_odestate{xs = map (*2) s_valueVector} -- just multiply all by 2 for every iteration
                                    s_substep'      = s_substep + 1 -- add more if you are folding
                                    i_i_d           = unpack i_i :: Data

      systemConstants'  | i_cs == 1 && i_ca == 0  = systemConstants -- reserved for status flags for the systemState 
                        | i_cs == 1 && i_ca == 1  = systemConstants{ maxtime = i_c_d }
                        | i_cs == 1 && i_ca == 2  = systemConstants{ timestep = i_c_d }
                        | i_cs == 1 && i_ca == 3  = systemConstants{ outputstep = i_c_u }
                        | i_cs == 1 && i_ca >= 4  = systemConstants{ userconstants = c_user' }
                        | otherwise               = systemConstants
                        where
                          c_user'   = replace i_ca (unpack i_c :: Data) c_user
                          i_c_d = unpack i_c :: Data
                          i_c_u = unpack i_c :: UInt

      --Set the output
      output = OutputSignals {leds_status = complement i_keys, control_readdata = 0, out_readdata = oul'}



