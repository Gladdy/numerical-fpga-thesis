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

  data SystemState = SystemState { values :: Vec 5 (BitVector 32)
                      , timevalue :: BitVector 32
                      , countvalue :: BitVector 32
                      , insertedvalue :: Bit
                      } deriving(Show)

  --data SystemConstants = SystemConstants { 
  --                    } deriving (Show)



  initialSystemState = SystemState {values = repeat 5 :: Vec 5 (BitVector 32), timevalue = 0, countvalue = 0, insertedvalue = 1} 
  initialState = (initialSystemState, 0)

  topEntity :: Signal InputSignals -> Signal OutputSignals
  topEntity = mealy forwardLEDS initialState


  forwardLEDS (systemState,outputLatch) input = ((systemState',outputLatch'),output)
    where
      --Unpack the input
      control_in = control_writedata input
      control_set = control_write input
      input_in = in_writedata input
      keys_in = keys_input input

      --Unpack the needed state
      valueVector = values systemState 
      count = countvalue systemState
      --inserted = insertedvalue systemState --act as a latch to only enter once instead of for as long as the control write bit is high
      
      -- on control_in == 1 and control_write isRising push an element into the vector
      (valueVector', count')    | control_set == 1 && control_in == 1   = ((control_in :> Nil) ++ init valueVector, count + 1)
                                | otherwise                             = (valueVector, count)
      
      systemState' = SystemState {values = valueVector', timevalue = 0, countvalue = count', insertedvalue = 1}
      
      outputLatch' = outputLatch

      --Set the output
      output = OutputSignals {leds_status = complement keys_in, control_readdata = 0, out_readdata = count'}



  --topEntity :: Signal (Signed 9, Signed 9) -> Signal (Signed 9)
  --topEntity = mealy macT 0

  --macT acc (x,y) = (acc',o)
  --  where
  --    acc' = acc + x * y
  --    o    = acc
