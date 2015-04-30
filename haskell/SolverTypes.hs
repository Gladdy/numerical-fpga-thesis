module SolverTypes where

    import Prelude

    type NumRepr = Float
    type DODEState = [NumRepr]

    data ODEState = ODEState { xs :: [NumRepr]
                             , t :: NumRepr
    } deriving (Show)

    data TimeSettings = TimeSettings { dt :: NumRepr
                                     , tMax :: NumRepr
    } deriving (Show)

    type Equation = (ODEState -> DODEState)
    type SolveMethod = TimeSettings -> Equation -> ODEState -> ODEState
