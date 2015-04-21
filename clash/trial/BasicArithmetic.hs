module BasicArithmetic where

	import CLaSH.Prelude

	ma acc (x,y) = acc + x * y


	macT acc (x,y) 	= (acc', o)
		where
			acc' 	= ma acc (x,y)
			o 		= acc

	mac = mealy macT 0

	topEntity :: Signal (Signed 9, Signed 9) -> Signal (Signed 9)
	topEntity = mac