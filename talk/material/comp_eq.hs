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