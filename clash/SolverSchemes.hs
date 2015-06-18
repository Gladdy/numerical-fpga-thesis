module SolverSchemes where

  import CLaSH.Prelude
  import SolverTypes

  euler :: Scheme
  euler constants equation state = state'
    where
      --Unpack the needed values
      c_user = userconstants constants
      c_maxtime = maxtime constants
      c_timestep = timestep constants
      
      t = time state
      xs = valueVector state

      --Apply Euler's integration scheme
      dxs = equation (state, c_user)
      xs' = if t < c_maxtime  then zipWith (+) xs $ map (*c_timestep) dxs
                              else xs -- already at maximum time
      t' = t + c_timestep

      state' = state {valueVector = xs', time = t'}

  {- 
  rk4 :: Scheme
  rk4 constants equation state = state'
    where
      --Unpack the needed values
      c_user = userconstants constants
      c_maxtime = maxtime constants
      c_timestep = timestep constants
      s_time = t initState
      xs = xs initState



      xs' = zipWith (+) xs $ map (c_timestep/6*) 
      k1 = 
      k2 = 
      k3 = 
      k4 =
      --apply the ODE to get dx
      d_xs = equation (initState, c_user)
      
      --Apply Euler's integration scheme whenever the max time has not yet been reached
      xs' = if s_time < c_maxtime  then zipWith (+) xs $ map (*c_timestep) d_xs 
                                            else xs -- already at c_maxtime 
      
      --Compute the new time and insert the time value into the xs
      finalState = initState {xs = xs', t = s_time + c_timestep}-}