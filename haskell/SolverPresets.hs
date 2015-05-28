module SolverPresets where

  import Prelude
  import SolverTypes

  unity :: [[NumRepr]]
  unity = [[1,0,0],[0,1,0],[0,0,1]]

  sinematrix :: [[NumRepr]]
  sinematrix = [[0,1],[-1,0]];

  vec :: [NumRepr]
  vec = [4,3,2]

  funcvec :: [SubFunction]
  funcvec = [(\t -> sin t),(\t -> exp (-t)), (\t -> sqrt t)]

  initODEState = ODEState [10, 0.0] 0.0
  initODEState2 = ODEState [1, -1] 0.0

  initTimeSettings = TimeSettings 0.01 10
  initTimeSettings2 = TimeSettings 0.01 3
