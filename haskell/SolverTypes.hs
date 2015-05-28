module SolverTypes where

  import Prelude

  type NumRepr = Float
  type D_ODEState = [NumRepr]

  data ODEState = ODEState { xs :: [NumRepr]
  , t :: NumRepr
  } deriving (Show)

  data TimeSettings = TimeSettings { dt :: NumRepr
  , tMax :: NumRepr
  } deriving (Show)

  type SubFunction = (NumRepr -> NumRepr)

  type Equation     = ODEState -> D_ODEState
  type SolveMethod  = TimeSettings -> Equation -> ODEState -> ODEState
  type Solver       = SolveMethod -> TimeSettings -> Equation -> ODEState  -> [ODEState]
