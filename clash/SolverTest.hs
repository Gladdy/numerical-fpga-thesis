module SolverTest where

  import CLaSH.Prelude
  import SolverTypes
  import Solver (topEntity)
  import Data.List

  defaultInputSignals = InputSignals  { keys_input = 0
                                  , switches_input = 0
                                  , control_write = 0
                                  , control_writedata = 0
                                  , control_address = 0
                                  , control_read = 0
                                  , in_write = 0
                                  , in_writedata = 0
                                  , in_address = 0
                                  , out_address = 0
                                  , out_read = 0
                                }
  dis = defaultInputSignals
  wis x = defaultInputSignals { in_write = 1
                              , in_address = x
                              , in_writedata = 31
                            }
  scs = defaultInputSignals   { control_write = 1
                              , control_writedata = 1 
                            }
  fvs x = defaultInputSignals { out_address = x
                              , out_read = 1
                            }


  basictest = Data.List.map out_readdata $ simulate topEntity [wis 1,scs,fvs 1,fvs 1,fvs 1, fvs 1, fvs 2, scs, fvs 1, fvs 1, fvs 1, scs, fvs 2, fvs 2]