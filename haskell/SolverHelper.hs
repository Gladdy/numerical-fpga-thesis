module SolverHelper where

    import Prelude
    import SolverTypes

    sumLists :: [[NumRepr]] -> [NumRepr] -> [NumRepr]
    sumLists [] factors         = []
    sumLists (xs:[]) factors    = map ((head factors)*) xs
    sumLists (xs:xss) factors   = zipWith (+) (map (head factors*) xs) (sumLists xss (tail factors))
