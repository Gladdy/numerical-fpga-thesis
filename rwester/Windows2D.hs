{-# LANGUAGE TypeOperators, TypeFamilies, FlexibleContexts, ExplicitForAll, ScopedTypeVariables #-}
module Windows2D_$P$ where

import CLaSH.Prelude

type Temp = Signed 24

vrotate xs = vtail xs <: vhead xs

windowsI :: (KnownNat (n + 1), ((m + n) + 1) ~ ((m + 1) + n))
         => SNat (m + 1)
         -> Vec (m + n + 1) a
         -> Vec (n + 1) (Vec (m + 1) a)
windowsI m xs = withSNat (\n -> windowsV m n xs)

windowsII :: (KnownNat (n + 1), KnownNat (m + 1), ((m + n) + 1) ~ ((m + 1) + n))
          => Vec (m + n + 1) a
          -> Vec (n + 1) (Vec (m + 1) a)
windowsII xs = withSNat (\m -> withSNat (\n -> windowsV m n xs))

rotated :: ((m + n) + 1) ~ ((m + 1) + n) 
        => SNat (m + 1) -> SNat (n + 1) 
        -> Vec (m + n + 1) a 
        -> Vec (n + 1) (Vec ((m + 1) + n) a)
rotated _ n xs = viterate n vrotate xs

windowsV :: ((m + n) + 1) ~ ((m + 1) + n)
         => SNat (m + 1) -> SNat (n + 1)
         -> Vec (m + n + 1) a
         -> Vec (n + 1) (Vec (m + 1) a)
windowsV m n xs = vmap (vtake m) (rotated m n xs)

vtranspose :: forall r c a . KnownNat c => Vec r (Vec c a) -> Vec c (Vec r a)
vtranspose m = vmap (\i -> vmap (!i) m) indices
 where
   indices = viterateI (subtract 1) (maxIndex indices) :: Vec c Integer 


map2d = vmap.vmap

windowsM :: ( ((rM + rN) + 1) ~ ((rM + 1) + rN)            
            , ((cM + cN) + 1) ~ ((cM + 1) + cN)
            , KnownNat (cN + 1)
            ) 
         => SNat (rM + 1) -> SNat (rN + 1)
         -> SNat (cM + 1) -> SNat (cN + 1)
         -> Vec (rM + rN + 1) (Vec (cM + cN + 1) a)
         -> Vec (rN + 1) (Vec (cN + 1) (Vec (rM + 1) (Vec (cM + 1) a)))
windowsM rM rN cM cN xss = vmap (vtranspose . vmap (windowsV cM cN)) (windowsV rM rN xss)

windowsMI :: ( ((rM + rN) + 1) ~ ((rM + 1) + rN)
             , ((cM + cN) + 1) ~ ((cM + 1) + cN)
             , KnownNat (cN + 1)
             , KnownNat (rN + 1)
             )
          => SNat (rM + 1)
          -> SNat (cM + 1)
          -> Vec (rM + rN + 1) (Vec (cM + cN + 1) a)
          -> Vec (rN + 1) (Vec (cN + 1) (Vec (rM + 1) (Vec (cM + 1) a)))
windowsMI rM cM xss = withSNat (\rN -> withSNat (\cN -> windowsM rM rN cM cN xss))

row1 = 1 :> 2 :> 3 :> 4 :> Nil
row2 = 5 :> 6 :> 7 :> 8 :> Nil
row3 = 9 :> 10 :> 11 :> 12 :> Nil

mat :: Vec 3 (Vec 4 Temp)
mat = row1 :> row2 :> row3 :> Nil


(+>>>) :: KnownNat n => Vec m a -> Vec (n + m) a -> Vec (m + n) a
l +>>> r = l <++> (vtakeI r)


-- some useful 2D matrix manipulation functions
vtakeh n img = vmap (vtake n) img
vtakev n img = vtake n img
vdroph n img = vmap (vdrop n) img
vdropv n img = vdrop n img
vmergeh imga imgb = vzipWith (<++>) imga imgb
vmergev imga imgb = imga <++> imgb


-- todo make parameterizable
swarch2d ::(Vec 3 (Vec 3 Temp) -> Temp) ->  
  (Vec 3 (Vec $M$ Temp), Vec 2 (Vec $Q$ Temp)) -> 
  Vec 1 (Vec $P$ Temp) -> 
  ((Vec 3 (Vec $M$ Temp), Vec 2 (Vec $Q$ Temp)), Vec 1 (Vec $P$ Temp))
swarch2d f (ws, ss) inp = ((ws', ss'), outp)
  where
    hp = d$P$
    outp = slideWindow2D f ws
    ws' = vmergeh (vdroph hp ws) (vmergev shead inp)
    shead = vtakeh hp ss
    ss' = vmergeh (vdroph hp ss) (vtakeh hp $ vdropv d1 ws)


slideWindow2D f inp = res
  where
    res = map2d f $ windowsMI d3 d3 inp

hfk2d :: Vec 3 (Vec 3 Temp) -> Temp
hfk2d img = res
  where
    (tt, tr, tb, tl, tc) = (img ! 0 ! 1, img ! 1 ! 2, img ! 2 ! 1, img ! 1 ! 0, img ! 1 ! 1)
    multwc a = shiftR (a * 3932) 14
    res = tc + multwc (-4*tc + tt + tr + tb + tl)

hfarchL = (swarch2d hfk2d) <^> (vcopyI (vcopyI 0), vcopyI (vcopyI 0))


inpreducer :: Bit ->
  (Temp, Vec 1 (Vec $P$ Temp), Unsigned 8) ->
  (Bit, (Vec 1 (Vec $P$ Temp), Temp))
inpreducer ss (valin, doutarch, sel) = (ss', (dinarch, res))
  where
    ss' = ss
    dinarch = vcopyI (vcopyI valin)
    res = (doutarch ! (0 :: Unsigned 1)) ! sel

inpreducerL = inpreducer <^> L

topEntity (val, sel) = res
  where
    (inpdata, res)  = inpreducerL (val, doutarch, sel)
    doutarch        = pack (hfarchL (unpack inpdata))

