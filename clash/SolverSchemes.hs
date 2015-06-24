module SolverSchemes where

  import CLaSH.Prelude
  import SolverTypes

  euler :: Scheme
  euler constants equation state = state'
    where
      --Unpack the needed values
      c_user = userconstants constants
      c_maxtime = maxtime constants

      h = timestep constants
      t = time state
      xs = valueVector state

      --Apply Euler's integration scheme
      eulerxs = zipWith (+) xs $ map (*h) (equation (state, c_user))
      
      --Check the time constraints
      (xs',t') = if t < c_maxtime then (eulerxs, t + h)
                                  else (xs,t) -- already at maximum time

      state' = ODEState {valueVector = xs', time = t'}

  rk4 :: Scheme
  rk4 constants equation state = state'
    where
      --Unpack the needed values
      c_user = userconstants constants
      c_maxtime = maxtime constants

      h = timestep constants
      t = time state
      xs = valueVector state

      h2 = 0.5*h
      h6 = 0.166666666666666666666666666666666*h

      --Apply the RK4 method
      rkxs = zipWith (+) xs $ map (h6*) $ zipWith (+) (zipWith (+) k1 k4) (map (*2) $ zipWith (+) k3 k4)
      k1 = equation (state, c_user)
      k2 = equation (ODEState { time = t + h2,  valueVector = zipWith (+) xs $ map (h2*) k1} ,c_user)
      k3 = equation (ODEState { time = t + h2,  valueVector = zipWith (+) xs $ map (h2*) k2} ,c_user)
      k4 = equation (ODEState { time = t + h,   valueVector = zipWith (+) xs $ map (h*) k3} ,c_user)
      

      --Check the time constraints
      (xs',t') = if t < c_maxtime then (rkxs, t + h)
                                  else (xs, t)
      
      state' = ODEState {valueVector = xs', time = t'}