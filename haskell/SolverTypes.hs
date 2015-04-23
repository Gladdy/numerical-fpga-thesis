module SolverTypes where

    type NumRepr = Float
    
    data ODEState = ODEState { xs :: [NumRepr]
                             , t :: NumRepr
    } deriving (Show)

    data TimeSettings = TimeSettings { dt :: NumRepr
                                     , tMax :: NumRepr
    } deriving (Show)

    type Equation = (ODEState -> ODEState)
    type SolveMethod = TimeSettings -> Equation -> ODEState -> ODEState