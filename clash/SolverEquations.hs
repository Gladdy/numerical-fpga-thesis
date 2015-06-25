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


  matrix3d :: Equation
  matrix3d (odestate, constants) = dxs
    where
      xs = valueVector odestate

      c0 = constants !! 4
      c1 = constants !! 5
      c2 = constants !! 6
      c3 = constants !! 7
      c4 = constants !! 8
      c5 = constants !! 9
      c6 = constants !! 10
      c7 = constants !! 11
      c8 = constants !! 12

      x0 = c0 * (xs !! 0) + c1 * (xs !! 1) + c2 * (xs !! 2)
      x1 = c3 * (xs !! 0) + c4 * (xs !! 1) + c5 * (xs !! 2)
      x2 = c6 * (xs !! 0) + c7 * (xs !! 1) + c8 * (xs !! 2)

      dxs = fst $ shiftInAt0 xs (x0 :> x1 :> x2 :> Nil)

  matrix4d :: Equation
  matrix4d (odestate, constants) = dxs
    where
      xs = valueVector odestate

      c0 = constants !! 4
      c1 = constants !! 5
      c2 = constants !! 6
      c3 = constants !! 7
      c4 = constants !! 8
      c5 = constants !! 9
      c6 = constants !! 10
      c7 = constants !! 11
      c8 = constants !! 12
      c9 = constants !! 13
      c10 = constants !! 14
      c11 = constants !! 15
      c12 = constants !! 16
      c13 = constants !! 17
      c14 = constants !! 18
      c15 = constants !! 19
      

      x0 = c0 * (xs !! 0)   + c1 * (xs !! 1)  + c2 * (xs !! 2)  + c3 * (xs !! 3)
      x1 = c4 * (xs !! 0)   + c5 * (xs !! 1)  + c6 * (xs !! 2)  + c7 * (xs !! 3)
      x2 = c8 * (xs !! 0)   + c9 * (xs !! 1)  + c10 * (xs !! 2) + c11 * (xs !! 3)
      x3 = c12 * (xs !! 0)  + c13 * (xs !! 1) + c14 * (xs !! 2) + c15 * (xs !! 3)

      dxs = fst $ shiftInAt0 xs (x0 :> x1 :> x2 :> x3 :> Nil)