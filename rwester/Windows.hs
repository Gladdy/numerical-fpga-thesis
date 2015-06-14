{-# LANGUAGE TypeOperators, TypeFamilies, FlexibleContexts, ExplicitForAll, ScopedTypeVariables #-}
module Windows_$P$ where

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


(+>>>) :: KnownNat n => Vec m a -> Vec (n + m) a -> Vec (m + n) a
l +>>> r = l <++> (vtakeI r)

-- M = 4  P = 2 where P = parrallelization factor M=P+3-1
swarch1d ::(Vec 3 Temp -> Temp) ->  
  Vec $M$ Temp -> 
  Vec $P$ Temp -> 
  (Vec $M$ Temp, Vec $P$ Temp)
swarch1d f xs inp = (xs', outp)
  where
    xs'  = inp +>>> xs
    outp = vmap f $ windowsII xs

hfk1d :: Vec 3 Temp -> Temp
hfk1d xs = x2 + multwc (x1 - 2 * x2 + x3)
  where
    (x1, x2, x3 ) = (xs ! 2, xs ! 1, xs ! 0)
    multwc a = shiftR (a * 410) 10

hfarchL = (swarch1d hfk1d) <^> (vcopyI 0)

inpreducer ::
  Vec $P$ Temp -> 
  (Temp, Vec $P$ Temp, Unsigned 8) ->
  (Vec $P$ Temp , (Vec $P$ Temp, Temp))
inpreducer ss (valin, doutarch, sel) = (ss' , (dinarch, res))
  where
    ss' = valin +>> ss
    dinarch = vreplace ss (toInteger sel) valin
    res = doutarch ! (toInteger sel)

inpreducerL = inpreducer <^> (vcopyI 0)

topEntity (val, sel) = res
  where
    (inpdata, res)  = inpreducerL (val, doutarch, sel)
    doutarch        = pack (hfarchL (unpack inpdata))



