module SolverEquations where

  import CLaSH.Prelude
  import SolverTypes

  expDecay :: Equation
  expDecay (odeState, constants) = valueVector'
    where
      valueVector = xs odeState
      multiplier = constants !! 4
      offset = constants !! 5
      pre_valueVector = map (*multiplier) valueVector
      valueVector' = map (+offset) pre_valueVector

  matrix2d :: Equation
  matrix2d (odeState, constants) = valueVector'
    where
      valueVector = xs odeState
      c1 = constants !! 4
      c2 = constants !! 5
      c3 = constants !! 6
      c4 = constants !! 7

      x0 = c1 * (valueVector !! 0) + c2 * (valueVector !! 1)
      x1 = c3 * (valueVector !! 0) + c4 * (valueVector !! 1)
      valueVector' = fst $ shiftInAt0 valueVector (x0 :> x1 :> Nil)