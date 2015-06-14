module Solver where

  import CLaSH.Prelude
  import CLaSH.Signal.Explicit (systemClock)
  
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
  
  data InputSignals = InputSignals { keys_input :: BitVector 4   -- keys_input
                      , switches_input    :: BitVector 4   -- switches_input 
                      , control_write     :: Bit           -- control_write
                      , control_writedata :: BitVector 32  -- control_writedata
                      , control_address   :: BitVector 8   -- control_address
                      , control_read      :: Bit           -- control_read
                      , in_write          :: Bit           -- in_write
                      , in_writedata      :: BitVector 32  -- in_writedata
                      , in_address        :: BitVector 8   -- in_address
                      , out_address       :: BitVector 8   -- out_address
                      } deriving(Show)

  data OutputSignals = OutputSignals  { leds_status :: BitVector 4   -- leds_status
                       , control_readdata :: BitVector 32  -- control_readdata
                       , out_readdata :: BitVector 32  -- out_readdata
                       } deriving(Show)

  topEntity :: Signal InputSignals -> Signal OutputSignals
  topEntity = mealy forwardLEDS 0

  forwardLEDS state input = (state',output)
    where
      state' = state
      output = OutputSignals {leds_status = switches_input input, control_readdata = 0, out_readdata = 0}


  --topEntity :: Signal (Signed 9, Signed 9) -> Signal (Signed 9)
  --topEntity = mealy macT 0

  --macT acc (x,y) = (acc',o)
  --  where
  --    acc' = acc + x * y
  --    o    = acc
