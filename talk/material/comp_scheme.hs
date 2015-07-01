euler :: Scheme
euler constants equation state = state'
  where
    c_user = userconstants constants
    c_maxtime = maxtime constants
    h = timestep constants
    t = time state
    xs = valueVector state

    --Apply Euler's integration scheme
    eulerxs = zipWith (+) xs $ map (*h) (equation (state, c_user))
    (xs',t') = if t < c_maxtime then (eulerxs, t + h)
                                 else (xs,t) -- already at maximum time

    state' = ODEState {valueVector = xs', time = t'}