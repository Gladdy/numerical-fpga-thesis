import Data.List
import Data.List.Split
import System.Random
import Data.Bits

import SignalVisualization
import SignalHOFs


delta :: Double -> Double
delta 0.0 = 1.0
delta t = 0.0

window :: Double -> Double -> Double
window w t = if (t > (-w)) && (t<= w) then 1.0 else 0.0

sinc :: Double -> Double -> Double
sinc w 0.0 = 1.0
sinc w t = sin  q / q
	where
		q = 2 * pi * w * t

sincLP :: Double -> Double
sincLP t = sinc 35.0 t

gauss :: Double -> Double -> Double -> Double
gauss m s t = exp ((-(t-m)^2) / (2*s^2))

samplefreq = 200.0

s1 :: Double -> Double
s1 t = 1.0 * cos (2.0 * pi * 5.0 * t)

s2 :: Double -> Double
s2 t = 0.3 * sin (2.0 * pi * 65.0 * t)

s3 t = s1 t + s2 t

discretize :: Double -> (Double -> Double) -> [Double]
discretize w f = norm ys
	where
		ts1 = [0.0,1.0/samplefreq..w]
		ts = (reverse $ map (*(-1.0)) $ tail ts1) ++ ts1 
		ys = map f ts

discretizeInvert :: Double -> (Double -> Double) -> [Double]
discretizeInvert w f = hs'
	where
		hsf = discretize w f
		hsd = discretize w delta
		hs' = zipWith (-) hsd hsf

dotpr as bs = foldl (+) 0 $ zipWith (*) as bs
norm as = map (*c) as
	where
		c = 1.0 / sum as

convolve as bs = convolve1 as ((replicate (length as - 1) 0.0) ++ bs)

convolve1 :: [Double] -> [Double] -> [Double]
convolve1 as bs
	|	length bs >= length as 	=  (dotpr as $ take (length as) bs): (convolve1 as (tail bs))
	|	otherwise 				= []


dw = 2.0
ds3 = discretize dw s3


hssinclp = discretize 0.5 sincLP
hssinchp = discretizeInvert 0.5 sincLP
hsgauss = discretize 0.5 (gauss 0 (1.0/50))
hsgaussinv = discretizeInvert 0.5 (gauss 0 (1.0/50))


main = do
	show1DSignals [
		 ds3, 
		 convolve hssinclp ds3, 
		 convolve hssinchp ds3
		 --convolve hsgauss ds3,
		 --convolve hsgaussinv ds3
		]


