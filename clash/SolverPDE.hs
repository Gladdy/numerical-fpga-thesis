module SolverPDE where

  import CLaSH.Prelude
  import SolverTypesPDE
  
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

  initialSystemState = SystemStatePDE { count = 0
                                      , substep = uIntMax
                                  }
  initialSystemConstants = SystemConstants  { maxtime = 125
                                            , timestep = 0.01
                                            , outputstep = 5
                                            , userconstants = repeat 0 :: ConstantVector
                                          }
  
  initialState = (initialSystemState, initialSystemConstants, 0 :: BitVector 32, 1 :: Bit)
  

  topEntity :: Signal InputSignals -> Signal OutputSignals
  topEntity inputSignals = outputSignals
    where
      initMemory = repeat 0 :: MemoryVector
      mO = blockRam initMemory wA rA wE wV

      outputSignalsWithRam = mealy solvePDE initialState (inputSignals, RamInput { memOut = mO})
      outputSignals = fst $ outputSignalsWithRam
      ramSignals = snd $ outputSignalsWithRam

      wA = write_address ramSignals
      rA = read_address ramSignals
      wE = write_enable ramSignals
      wV = write_value ramSignals


  solvePDE (systemState,systemConstants,oul,block) (input,ramInput) = ((systemState',systemConstants',oul',block'),(output, ramOutput))
    where
      i_keys = keys_input input
      i_switches = switches_input
      
      --Unpack the input
      i_c = control_writedata input
      i_ca = control_address input
      i_cs = control_write input
      i_cr = control_read input

      i_i = in_writedata input
      i_ia = in_address input
      i_is = in_write input
      
      i_oa = out_address input
      i_or = out_read input

      --Unpack the state
      s_substep = substep systemState
      s_count = count systemState

      --Unpack the constants
      c_substep = outputstep systemConstants
      c_user = userconstants systemConstants


      -- Control signal
      -- addresses: 
      -- 0 <- status flags { 1 starts a round of computation, 2 resets the state, 3 resets the constants}
      -- 1 <- write input on address specified by control_data to ram 
      -- 2 <- write ram on address specified by control_data to output
      -- 3 <- write maxtime to constants
      -- 4 <- write timestep to constants
      -- 5 <- write outputstep to constants
      -- 6 <- custom constants etc.

      --write the input into ram when at location control when writing at control address 1
      --write the ram address to output when control address 2
      (systemState', oul', block', ramOutput) | i_cs == 1 && i_ca == 1 = (systemState, 50 :: UInt, block, noRamOutput { write_address = signal i_c_u
                                                                                                              , write_enable = signal True
                                                                                                              , write_value = signal (unpack i_i :: Data)
                                                                                                              } )
                                              | i_cs == 1 && i_ca == 2 = (systemState, readValue, block, ramOutput{write_enable = 0})
                                              where
                                                i_c_u = unpack i_c :: UInt
                                                readValue = pack $ memOut ramInput


      systemConstants'  | i_c == 3 && i_cs == 1 && i_ca == 0    = initialSystemConstants   -- reset the constants 
                        | i_cs == 1 && i_ca == 3                = systemConstants{ maxtime = i_c_d }
                        | i_cs == 1 && i_ca == 4                = systemConstants{ timestep = i_c_d }
                        | i_cs == 1 && i_ca == 5                = systemConstants{ outputstep = i_c_u }
                        | i_cs == 1 && i_ca >= 6                = systemConstants{ userconstants = c_user' }
                        | otherwise                             = systemConstants
                        where
                          c_user'   = replace i_ca (unpack i_c :: Data) c_user
                          i_c_d = unpack i_c :: Data
                          i_c_u = unpack i_c :: UInt

      --Set the output
      leds = complement i_keys
      output = OutputSignals {leds_status = leds, control_readdata = 0, out_readdata = oul'}



