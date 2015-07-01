module MAC where
  import CLaSH.Prelude

  topEntity :: Signal (Signed 9, Signed 9) -> Signal (Signed 9)
  topEntity = mealy mac 0

  mac :: Num t => t -> (t, t) -> (t, t)
  mac state input = (state',output)
    where
      (x,y)   = input         -- unpack the two inputs
      state'  = state + x*y   -- the new state
      output  = state'        -- output the new state