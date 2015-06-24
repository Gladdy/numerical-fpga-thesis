module SignalHOFs where

import Data.List
import Data.List.Split

type Img a = [[a]]
type Line a = [a]


width :: Img a -> Int
width img = length $ img !! 0

height :: Img a -> Int
height img = length img

size :: Img a -> (Int, Int)
size img = (width img, height img)

takeh :: Int -> Img a -> Img a
takeh m xss = map (take m) xss

takev :: Int -> Img a -> Img a
takev m xss = take m xss

droph :: Int -> Img a -> Img a
droph m xss = map (drop m) xss

dropv :: Int -> Img a -> Img a
dropv m xss = drop m xss

foldlt :: (a -> b -> a) -> a -> Img b -> a
foldlt f a img = foldl (foldl f) a img

map2d :: (a -> b) -> Img a -> Img b
map2d f img = map (map f) img

zipWith2d :: (a -> b -> c) -> Img a -> Img b -> Img c
zipWith2d f = zipWith (zipWith f)

mergeh :: Img a -> Img a -> Img a
mergeh imgl imgr = zipWith (++) imgl imgr

mergev :: Img a -> Img a -> Img a
mergev imgl imgr = imgl ++ imgr

take2d :: (Int, Int) -> (Int, Int) -> Img a -> Img a
take2d (x, y) (w, h) img = takeh w $ takev h $ dropv y $ droph x img

replace2d :: (Int, Int) -> Img a -> Img a -> Img a
replace2d (x, y) imgrpl img = img'
	where
		(iw, ih) = size img
		(rw, rh) = size imgrpl
		imgt = takev y img
		imgb = dropv (y+rh) img
		imgl = take2d (0, y) (x,rh) img
		imgr = take2d (x+rw, y) (iw-x-rw, rh) img
		img' = mergev imgt $ mergev (mergeh imgl $ mergeh imgrpl imgr) imgb

concat2d :: Img (Img a) -> Img a
concat2d imgss = foldl1 mergev $ map (foldl1 mergeh) imgss

splitIntoCols :: Int -> Img a -> [Img a]
splitIntoCols cw img
	| width img >= cw 	= (takeh cw img) : (splitIntoCols cw $ droph cw img)
	| otherwise			= []

splitIntoRows :: Int -> Img a -> [Img a]
splitIntoRows rh img
	| height img >= rh 	= (takev rh img) : (splitIntoRows rh $ dropv rh img)
	| otherwise			= []

splitImage :: Int -> Int -> Img a -> Img (Img a)
splitImage rh cw img = map (splitIntoCols cw) $ splitIntoRows rh img


-- simulation function for any mealy machine
simulate f s [] = []
simulate f s (i:is) = o : (simulate f s' is)
	where
		(s', o) = f s i
