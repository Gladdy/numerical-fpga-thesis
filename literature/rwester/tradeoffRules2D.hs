import Data.List
import Data.Maybe
import System.Process
import System.Random
import Data.List.Split

import SignalHOFs
import SignalVisualization
import ExampleInputs

data ImgRegion = TL | T | TR | L | R | BL | B | BR | C


slideWindow2D :: (Int, Int) -> (Img a -> b) -> Img a -> Img b
slideWindow2D (ww, wh) f img
	| height img >= wh 	= (slideStripe2D ww f $ takev wh img) : (slideWindow2D (ww, wh) f $ dropv 1 img)
	| otherwise			= []

slideStripe2D :: Int -> (Img a -> b) -> Img a -> Line b
slideStripe2D ww f img
	| width img >= ww 	= (f $ takeh ww img) : (slideStripe2D ww f $ droph 1 img)
	| otherwise			= []

slideWindow2DST :: (Int, Int) -> (Int, Int) -> (Img a -> b) -> Img a -> Img b
slideWindow2DST (ww, wh) (hp, vp) f img = img'
	where
		(hw, hh) = (ww `div` 2, wh `div` 2)
		imgss = swsplit2D (hw, hh) (hp, vp) $ extendImg (hw, hh) img
		img'  = concat2d $ map2d (slideWindow2D (ww, wh) f) imgss

extendImg :: (Int, Int) -> Img a -> Img a
extendImg (hw, hh) img = img2
	where
		extend w inp = map (\l -> (replicate w $ head l) ++ l ++ (replicate w $ last l)) inp
		img1 = extend hw img
		img2 = transpose $ extend hh $ transpose img1

swsplit2D :: (Int, Int) -> (Int, Int) -> Img a -> Img (Img a)
swsplit2D (hw, hh) (hp, vp) img
	| height img >= (2*hh+vp)	= (splitstripe hw hp $ takev (2*hh+vp) img) : (swsplit2D (hw, hh) (hp, vp) $ dropv vp img)
	| otherwise 				= []

splitstripe ::  Int -> Int -> Img a -> [Img a]
splitstripe hw hp stripe
	| width stripe >= (2*hw+hp)	= (takeh (2*hw+hp) stripe) : (splitstripe hw hp $ droph hp stripe)
	| otherwise 				= []


-- Window functions for different applications
dotpr2D xss yss = foldlt (+) 0 $ zipWith2d (*) xss yss

gaussian :: Int -> Img Double -> Double
gaussian hw inp = dotpr2D inp cs
	where
		hwf = fromIntegral hw :: Double
		sigma = hwf / 3.0
		cs = chunksOf (2*hw+1) [ 1/(2*pi*sigma**2)*exp (-(x^2+y^2)/(2*sigma**2)) | x <- [-hwf..hwf], y <- [-hwf..hwf]]

sobel :: Img Double -> Double
sobel inp = sqrt $ dx**2 + dy**2
	where
		csx	= [[1,0,-1], [2,0,-2], [1,0,-1]] :: Img Double
		csy = transpose csx
		dx 	= dotpr2D csx inp
		dy 	= dotpr2D csy inp

hfkernel2D :: Img Double -> Double
hfkernel2D inp = dotpr2D inp cs
	where
		c = 0.24
		cs = [[0,c,0], [c,1-4*c,c], [0,c,0]]

centerkernel :: Img a -> a
centerkernel img = img !! 1 !! 1

-- Game of life kernel
golkernel :: Img Double -> Double
golkernel inp = res
	where
		nc = length $ filter (==1.0) $ concat [(inp !! 0), [inp !! 1 !! 0, inp !! 1 !! 2],inp !! 2 ] -- neighbour count
		ccv = inp !! 1 !! 1 -- current cell value
		res = if ccv == 1
				then
					if nc == 2 || nc == 3 then 1.0 else 0.0
				else
					if nc == 3 then 1.0 else 0.0


hfiteration :: (Double, Double, Double, Double) -> Img Double -> Img Double
hfiteration (tt, tr, tb, tl) tss = tss'
	where
		m = length (tss !! 0)
		rt = [0] ++ (replicate m tt) ++ [0]
		rb = [0] ++ (replicate m tb) ++ [0]
		mrs = map (\r -> [tl] ++ r ++ [tr]) tss
		img = [rt] ++ mrs ++ [rb]
		tss' = slideWindow2D (3, 3) hfkernel2D img

goliteration :: Img Double -> Img Double
goliteration cs = cs'
	where
		(iw, ih) = size cs
		cs1 = mergeh (replicate ih [0]) $ mergeh cs (replicate ih [0])
		cs2 = mergev [(replicate (iw+2) 0)] $ mergev cs1 [(replicate (iw+2) 0)]
		cs' = slideWindow2D (3,3) golkernel cs2

heatflow (tt, tr, tb, tl) tss = iterate (hfiteration (tt, tr, tb, tl)) tss

gameoflife cs = iterate goliteration cs


-- create an architecture and data preparation function from a sliding window function
createSWArch :: (Int, Int) -> (Int, Int) -> (Img a -> b) -> ((Img a -> [Img a]) , (s -> Img a -> (s, Img b)))
createSWArch (ww, wh) (hp, vp) swf = (dpf, archf)
	where
		(hw, hh) 	= (ww `div` 2, wh `div` 2)
		dpf img 	= concat $ swsplit2D (hw, hh) (hp, vp) img
		archf s img = let
						s' = s
						os = slideWindow2D (ww, wh) swf img
					  in (s', os)



-- create an efficient architecture and data preparation function from a sliding window function
createESWArch :: a -> (Int, Int) -> (Int, Int) -> (Int, Int) -> (Img a -> b) -> ((Img a -> [Img a]), (Img a, Img a), ((Img a, Img a) -> Img a -> ((Img a, Img a), Img b)))
createESWArch ival (iw, ih) (ww, wh) (hp, vp) swf = (dpf, istate, archf)
	where
		(hw, hh)  			= (ww `div` 2, wh `div` 2)
		dpf img 			= let inps = concat $ splitImage vp hp img in inps ++[last inps]
		istate				= if even ww || even wh || iw `mod` hp /= 0 || ih `mod` vp /= 0 || (iw - 2*hw) `mod` hp /= 0 || (ih - 2*hh) `mod` vp /= 0
								then error "window size or parallelization factor doesnt fit in image" 
								else (replicate (vp+2*hh) (replicate (hp+2*hw) ival), replicate (2*hh) (replicate (iw-(hp+2*hw)) ival))
		archf (w, s) img 	= let
							 	os = slideWindow2D (ww, wh) swf w
							 	w' = mergeh (droph hp w) (mergev shead img)
							 	shead = takeh hp s
							 	s' = mergeh (droph hp s) (takeh hp $ dropv vp w)
					  	   	  in ((w', s'), os)

-- Convert the stream from a sliding window architecture back into an image for easy validation
swarchres2img :: (Int, Int) -> (Int, Int) -> (Int, Int) -> [Img a] -> Img a
swarchres2img (iw, ih) (ww, wh) (hp, vp) swarchres = img
	where
		(hw, hh)  	= (ww `div` 2, wh `div` 2)
		rtd 		= ceiling (fromIntegral (vp + 2 * hh) / fromIntegral vp) - 1
		ctd 		= ceiling $ fromIntegral (hp + 2 * hw) / fromIntegral hp
		swarchres1 	= drop (rtd * (iw `div` hp) + ctd) swarchres -- drop results produced during filling of buffers
		rec 		= (iw - 2* hw) `div` hp -- Row element count
		swarchres1s = chunksOf (rec+(2*hw `div` hp)) swarchres1
		img 		= concat2d $ (map (take rec) $ init swarchres1s) ++ [last swarchres1s]

-- create a a heatflow simulation architecture based on sliding window archtecture and 2D buffer
-- returns archf, the mealy machine for the whole architecture, istate is the initial state and 
-- ppf, the post-processing-function that transforms the output of the architecture into a stream of images
createEHFArch :: Img Double
     -> (Double, Double, Double, Double)
     -> (
     		(Img Double, Int, Img Double, Img Double) -> i -> ((Img Double, Int, Img Double, Img Double), Maybe (Img Double)),
         	(Img Double, Int, Img Double, Img Double), 
         	[Maybe (Img Double)] -> [Img Double]
        )
createEHFArch inpts (tt, tr, tb, tl) = (archf, istate, ppf)
	where
		-- fist calculate some constants
		(iiw, iih) 	= size inpts -- dimensions of input image
		((iw, ih), (ww, wh), (hp, vp)) = ((iiw+2*hw, iih+2*hh), (3,3), (2,2))
		(hw, hh) 	= (ww `div` 2, wh `div` 2)
		(hcc, vcc, icc) = (iw `div` hp, ih `div` vp, hcc * vcc)
		-- determine the latency in number of cells (lcc: latency cell count)
		rtd 		= ceiling (fromIntegral (vp + 2 * hh) / fromIntegral vp) - 1
		ctd 		= ceiling $ fromIntegral (hp + 2 * hw) / fromIntegral hp
		lcc 		= rtd * hcc + ctd
		-- extend initial set of temperatures with border temperatures
		ts1 = mergeh (replicate iih [tl]) $ mergeh inpts (replicate iih [tr])
		ts2 = mergev [(replicate iw tt)] $ mergev ts1 [(replicate iw tb)]
		--create the post processing function: outputstream to images
		ppf xs 	= let
					js 	= catMaybes xs
					(ihcc, ivcc) = (iiw `div` hp, iih `div` vp)
					-- take as many samples to create a list of complete images:
					js' = take ((ihcc * ivcc) * (floor $ fromIntegral (length js) / fromIntegral (ihcc * ivcc))) js
				  in 
				 	map concat2d $ map (chunksOf ihcc) $ chunksOf ((iiw `div` hp) * ivcc) js'

		-- create architecture for sliding window calculations
		(_, swistate, swarchf) = createESWArch 0.0 (iw, ih) (ww, wh) (hp, vp) hfkernel2D
		-- create architecture for the buffer of intermediate temperatures
		bufarchf (ts, cntr) i 	= let
									tsout 	= concat (splitImage vp hp ts) !! (cntr `mod` icc) -- select a subset of temperatures for the swarchf
									valid 	= cntr >= lcc && rownr < (hcc-1) && colnr < (vcc-1) -- not all outputs of swarchf are meaningfull
									rownr 	= floor (fromIntegral ((cntr - lcc) `mod` icc) / fromIntegral hcc)
									colnr 	= ((cntr - lcc) `mod` icc) `mod` hcc
									cntr'	= cntr + 1
									(outp, ts') = if valid 
										then (Just i, replace2d (colnr*hp+hw, rownr*vp+hh) i ts) 
										else (Nothing, ts)
						  		  in
						  			((ts', cntr'), tsout, outp)
		-- Create the actual heatflow architecture by composing the buffer and sliding window function
		archf (ts, cntr, ws, ss) _ 	= let
										((ts', cntr'), bufout, outp) = bufarchf (ts, cntr) swres
										((ws', ss'), swres) = swarchf (ws, ss) bufout
									  in
									   	((ts', cntr', ws', ss'), outp)
		-- generate the initial state for simulation
		istate = (ts2, 0, fst swistate, snd swistate)


----------------------------------------------------------------------------
--  Creation and validation of generated sliding window architectures
----------------------------------------------------------------------------

-- Simple sliding window architecture with window that selects only the center pixel
img1 		= extendImg (1, 1) $ chunksOf 6 [1..36]
swf1 w 		= w !! 1 !! 1
img1resn 	= slideWindow2D (3, 3) swf1 img1
(dpf1, archf1) = createSWArch (3,3) (3,3) swf1
img1resarch	= simulate archf1 0 $ dpf1 img1
equal1 = img1resn == (concat2d $ chunksOf 2 img1resarch)

-- Sliding window architecture for Sobel filter
img2 		= extendImg (1, 1) $ imgsquare
img2resn 	= slideWindow2D (3, 3) sobel img2
(dpf2, archf2) = createSWArch (3,3) (8,8) sobel
img2resarch	= simulate archf2 0 $ dpf2 img2
equal2 = img2resn == (concat2d $ chunksOf 8 img2resarch)

-- Sliding window architecture for big Gaussian filter
img3 		= extendImg (2, 2) $ imgsquare
img3resn 	= slideWindow2D (5, 5) (gaussian 2) img3
(dpf3, archf3) = createSWArch (5,5) (16,16) (gaussian 2)
img3resarch	= simulate archf3 0 $ dpf3 img3
equal3 = img3resn == (concat2d $ chunksOf 4 img3resarch)


-- Efficient Sliding window architecture generated based on 3X3 window function
---------------------------------------------------------------------------------------
img4 		= extendImg (1,1) $ chunksOf 4 [1..16]
swf4 		= swf1
img4resn 	= slideWindow2D (3, 3) swf4 img4
(dpf4, istate4, archf4) = createESWArch 0 (size img4) (3, 3) (1, 1) swf4
img4resarch	= simulate archf4 istate4 $ dpf4 img4
equal4		= img4resn == swarchres2img (size img4) (3, 3) (1, 1) img4resarch

-- SW arch with parallelization of 2X2
img5		= img4
swf5 		= swf1
img5resn 	= slideWindow2D (3, 3) swf5 img5
(dpf5, istate5, archf5) = createESWArch 0 (size img5) (3, 3) (2, 2) swf5
img5resarch	= simulate archf5 istate5 $ dpf5 img5
equal5		= img5resn == swarchres2img (size img5) (3, 3) (2, 2) img5resarch

-- SW arch with parallelization of 1X2
img6		= img4
swf6 		= swf1
img6resn 	= slideWindow2D (3, 3) swf6 img6
(dpf6, istate6, archf6) = createESWArch 0 (size img6) (3, 3) (1, 2) swf6
img6resarch	= simulate archf6 istate6 $ dpf6 img6
equal6		= img6resn == swarchres2img (size img6) (3, 3) (1, 2) img6resarch

-- SW arch with parallelization of 2X1
img7		= img4
swf7 		= swf1
img7resn 	= slideWindow2D (3, 3) swf7 img7
(dpf7, istate7, archf7) = createESWArch 0 (size img7) (3, 3) (2, 1) swf7
img7resarch	= simulate archf7 istate7 $ dpf7 img7
equal7		= img7resn == swarchres2img (size img7) (3, 3) (2, 1) img7resarch


-- SW arch with swf of 5X3 and parallelization of 2X1
---------------------------------------------------------------------------------------
img8		= extendImg (2,1) $ chunksOf 4 [1..16]
swf8 img	= img !! 1 !! 2 
img8resn 	= slideWindow2D (5, 3) swf8 img8
(dpf8, istate8, archf8) = createESWArch 0 (size img8) (5, 3) (2, 1) swf8
img8resarch	= simulate archf8 istate8 $ dpf8 img8
equal8		= img8resn == swarchres2img (size img8) (5, 3) (2, 1) img8resarch

-- SW arch with swf of 3X5 and parallelization of 1X2
img9		= extendImg (1,2) $ chunksOf 4 [1..16]
swf9 img	= img !! 2 !! 1
img9resn 	= slideWindow2D (3, 5) swf9 img9
(dpf9, istate9, archf9) = createESWArch 0 (size img9) (3, 5) (1, 2) swf9
img9resarch	= simulate archf9 istate9 $ dpf9 img9
equal9		= img9resn == swarchres2img (size img9) (3, 5) (1, 2) img9resarch

-- SW arch with swf of 3X5 and parallelization of 2X2
img10		= img9
swf10 		= swf9
img10resn 	= slideWindow2D (3, 5) swf10 img10
(dpf10, istate10, archf10) = createESWArch 0 (size img10) (3, 5) (2, 2) swf10
img10resarch = simulate archf10 istate10 $ dpf10 img10
equal10		= img10resn == swarchres2img (size img10) (3, 5) (2, 2) img10resarch


-- Heatflow architecture with SWarch and buffering in streaming fashion
----------------------------------------------------------------------------
ehfarch_icount = 64 -- number of interations to simulate
ehfarch_cornertemps = (1.0, 1.0, 0.0, 0.0)
ehfarch_inp = chunksOf 64 $ replicate (64*64) 0.2
(ehfarch_archf, ehfarch_istate, ehfarch_ppf) = createEHFArch ehfarch_inp ehfarch_cornertemps
ehfarch_res = simulate ehfarch_archf ehfarch_istate $ replicate (33*33*ehfarch_icount+3) 0
ehfarch_res_imgs = ehfarch_ppf ehfarch_res
--Verify the results by comparing refernce heatfow and arch (drop 1 is due to iterate in heatflow: first image is initial temperatures)
ehfarch_equal = ehfarch_res_imgs == take ehfarch_icount (drop 1 $ heatflow ehfarch_cornertemps ehfarch_inp)




-- Test to show that normal sliding window application gives the same results as splitted one
res1 = slideWindow2D (3, 3) hfkernel2D (extendImg (1, 1) imgnumbers) 	== slideWindow2DST (3, 3) (4, 4) hfkernel2D imgnumbers
res2 = slideWindow2D (3, 3) sobel (extendImg (1, 1) imgnumbers) 		== slideWindow2DST (3, 3) (4, 4) sobel imgnumbers

res3 = slideWindow2D (3, 3) sobel (extendImg (1, 1) imgsquare) 			== slideWindow2DST (3, 3) (4, 4) sobel imgsquare
res4 = slideWindow2D (7, 7) (gaussian 3) (extendImg (3, 3) imgsquare) 	== slideWindow2DST (7, 7) (16, 16) (gaussian 3) imgsquare

main = do
	--putStrLn "Lena"
	--showImage $ mergeh lena (slideWindow2D (9, 9) (gaussian 4) lena)
	putStrLn "Game of Life."
	showImageStream $ take 64 $ gameoflife imggolslide
	putStrLn "Heatflow simulation using simple higher order function."
	showImageStream $ take ehfarch_icount (drop 1 $ heatflow ehfarch_cornertemps ehfarch_inp)
	--   putStrLn "Heatflow simulation using HW architecture."
	--   showImageStream ehfarch_res_imgs
	-- putStrLn $ "All checks succesfull: " ++ 
		-- show (all (==True) [equal1, equal2, equal3, equal4, equal5, equal6, equal7, equal8, equal9, equal10, res1, res2, res4, ehfarch_equal])
