module SolverEquations where

  import CLaSH.Prelude
  import SolverTypes

  matrix2d :: Equation
  matrix2d (odestate, constants) = dxs
    where
      xs = valueVector odestate
      
      c1 = constants !! 4
      c2 = constants !! 5
      c3 = constants !! 6
      c4 = constants !! 7

      x0 = c1 * (xs !! 0) + c2 * (xs !! 1)
      x1 = c3 * (xs !! 0) + c4 * (xs !! 1)
      
      dxs = fst $ shiftInAt0 xs (x0 :> x1 :> Nil)


  --should really be higher order function
  matrix3d :: Equation
  matrix3d (odestate, constants) = dxs
    where
      xs = valueVector odestate

      c1 = constants !! 4
      c2 = constants !! 5
      c3 = constants !! 6
      c4 = constants !! 7
      c5 = constants !! 8
      c6 = constants !! 9
      c7 = constants !! 10
      c8 = constants !! 11
      c9 = constants !! 12

      x0 = c1 * (xs !! 0) + c2 * (xs !! 1) + c3 * (xs !! 2)
      x1 = c4 * (xs !! 0) + c5 * (xs !! 1) + c6 * (xs !! 2)
      x2 = c7 * (xs !! 0) + c8 * (xs !! 1) + c9 * (xs !! 2)

      dxs = fst $ shiftInAt0 xs (x0 :> x1 :> x2 :> Nil)