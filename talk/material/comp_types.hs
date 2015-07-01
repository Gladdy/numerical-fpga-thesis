type Data = SFixed 8 24
type UInt = Unsigned 32
type ValueVector = Vec 5 Data
type ConstantVector = Vec 20 Data

data ODEState = ODEState { valueVector :: ValueVector 
                          , time :: Data
                          } deriving(Show)

type Equation = (ODEState, ConstantVector) -> ValueVector
type Scheme = SystemConstants -> Equation -> ODEState -> ODEState 


topEntity :: Signal InputSignals -> Signal OutputSignals
topEntity = mealy solveODE initialState

solveODE  state input = (state', output)
  where
    state  = (systemState,systemConstants,oul,block)
    state' = (systemState',systemConstants',oul',block')