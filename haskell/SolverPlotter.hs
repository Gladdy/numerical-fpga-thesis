module SolverPlotter where

  import Prelude
  import SolverTypes

  import Graphics.Rendering.Chart.Easy
  import Graphics.Rendering.Chart.Backend.Cairo

  solve :: SolveMethod -> TimeSettings -> Equation -> ODEState  -> [ODEState]
  solve solvemethod time equation initState
  | end = []
  | otherwise = initState : solve solvemethod time equation newState
  where
    newState = solvemethod time equation initState
    end = (t initState) > (tMax time)
  --signal :: [Double] -> [(Double,Double)]
  --signal xs = [ (x,cosh(x)) | x <- xs ]

  --outProps = fo_format .~ PDF $ def



  --main = toFile outProps "example.pdf" $ do
  --    layout_title .= "Amplitude Modulation"
  --    plot (line "am" [signal [-5,(-4.99)..5]])

