module Blinker where

  import CLaSH.Prelude

  {-# ANN topEntity
    (defTop
      { t_name     = "blinker"
      , t_inputs   = ["KEY1","KEY2"]
      , t_outputs  = ["LED"]
      , t_extraIn  = [ ("CLOCK_50", 1)
                   , ("KEY0"    , 1)
                   ]
      , t_clocks   = [ ClockSource "clock" Nothing [("CLOCK_50","clk")] Nothing "clock_stable" False]
    }) #-}


  --topEntity :: Signal (Signed 9, Signed 9) -> Signal (Signed 9)
  --topEntity = mealy macT 0

  --macT acc (x,y) = (acc',o)
  --  where
  --    acc' = ma acc (x,y)
  --    o    = acc

  --ma acc (x,y) = acc + x * y


  topEntity :: (Signal Bit, Signal Bit) -> Signal (Unsigned 8)
  topEntity (key1, key2) = mealy blinkerT (1,0) key1R
    where
      key1R = isRising 1 key1
      key2R = isRising 1 key2

  blinkerT (leds,cntr) key1R = ((leds',cntr'),leds)
    where
      cnt_max = 255
      cntr' | key1R     = if cntr > cnt_max then 0
                                            else cntr + 1
            | otherwise = cntr
      leds' = cntr'
