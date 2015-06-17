module SolverSchemes where

  import CLaSH.Prelude
  import SolverTypes

  eulerScheme :: Scheme
  eulerScheme constants equation initState = finalState
    where
      --Unpack the needed values
      c_user = userconstants constants
      c_maxtime = maxtime constants
      c_timestep = timestep constants
      s_time = t initState
      valueVector = xs initState

      --Compute the needed change in the valueVector
      d_valueVector = equation (initState, c_user)
      d_valueVector_euler = map (*c_timestep) d_valueVector

      --Update the valueVector by adding the change to the previous value
      valueVector_notime = if s_time > c_maxtime  then valueVector -- already at max time
                                                  else zipWith (+) valueVector d_valueVector_euler
      
      --Compute the new time and insert the time value into the valueVector
      t' = s_time + c_timestep
      valueVector' = replace 15 t' valueVector_notime

      finalState = initState {xs = valueVector', t = t'}