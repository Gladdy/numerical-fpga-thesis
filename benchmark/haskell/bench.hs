module Main where

  import Data.Matrix

  mat = fromLists [  
              [2.0,   3.0,  2.0,  0]
            , [-5.0,  -5.0, -3.0, 1]
            , [3.0,   -1.0, -2.0, -3.0]
            , [4.0,   2.0,  2.0,  -3.0]
            ]

  initialState = fromLists [
                    [1.0]
                  , [2.0]
                  , [3.0]
                  , [4.0]
                  ]

  mvecProduct h m v = scaleMatrix h $ multStd m v

  main = do print ((iterate (mvecProduct 0.01 mat) initialState) !! 1000000)
