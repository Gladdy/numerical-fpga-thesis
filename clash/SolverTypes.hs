module SolverTypes where

  import CLaSH.Prelude

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
                      , out_read          :: Bit
                      } deriving(Show)

  data OutputSignals = OutputSignals  { leds_status :: BitVector 4   -- leds_status
                       , control_readdata :: BitVector 32   -- control_readdata
                       , out_readdata     :: BitVector 32   -- out_readdata
                       } deriving(Show)

  data SystemState = SystemState { odestate :: ODEState
                    , step :: UInt
                    } deriving(Show)

  data SystemConstants = SystemConstants { maxtime :: Data
                        , timestep :: Data
                        , maxstep :: UInt
                        , userconstants :: ConstantVector
                      } deriving (Show)

  uIntMax = 4294967295 :: UInt

  type Data = SFixed 8 24
  type UInt = Unsigned 32
  type ValueVector = Vec 5 Data
  type ConstantVector = Vec 20 Data

  data ODEState = ODEState { valueVector :: ValueVector 
                            , time :: Data
                            } deriving(Show)

  type Equation = (ODEState, ConstantVector) -> ValueVector
  type Scheme = SystemConstants -> Equation -> ODEState -> ODEState 
