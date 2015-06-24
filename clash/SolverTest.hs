module SolverTest where

  import CLaSH.Prelude
  import SolverTypes
  import Solver
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
  --nothing
  dis = defaultInputSignals

  --write input
  cis x y = defaultInputSignals { control_write = 1
                              , in_address = x
                              , in_writedata = y
                            }
  
  --write input
  wis x y = defaultInputSignals { in_write = 1
                              , in_address = x
                              , in_writedata = y
                            }
  
  -- start compute
  scs = defaultInputSignals   { control_write = 1
                              , control_writedata = 1 
                            }

  -- get output
  fvs x = defaultInputSignals { out_address = x
                              , out_read = 1
                            }

  is =  [ wis 1 10
        , scs
        , dis
        , dis
        , fvs 1
        , fvs 2
        , scs
        , dis
        , dis
        , fvs 1
        , fvs 2
        , scs
        , fvs 1
        , fvs 2
        , fvs 1
        , fvs 2
        ]

  is2 = [ cis 4 (-1)
        , cis 5 7
        , wis 1 10
        , wis 2 20
        , wis 3 30
        , wis 4 40
        , scs
        , dis
        , dis
        , fvs 1
        , fvs 2
        , fvs 3
        , fvs 4
        ]

  test x = Data.List.take (Data.List.length x) $ Data.List.map out_readdata $ simulate topEntity x