module SolverPlotter where

  import Prelude
  import SolverTypes
  import GHC.Float

  import Graphics.Rendering.Chart.Easy
  import Graphics.Rendering.Chart.Backend.Cairo

  outProps = fo_format .~ PDF $ def

  plotSolutions :: [([ODEState] , String)] -> String -> String -> IO()
  plotSolutions solutions title filename = toFile outProps filename $ do
    layout_title .= title
    layout_x_axis . laxis_title .= "time"
    layout_y_axis . laxis_title .= "x" 
    plotSolution (solutions !! 0)
    plotSolution (solutions !! 1)

  plotSolution (solution, curveTitle) = plot $ line curveTitle [states]
    where
      states = reformData solution


  reformData :: [ODEState] -> [(Double, Double)]
  reformData states = map reformState states

  reformState :: ODEState -> (Double, Double)
  reformState state = (float2Double tVal, float2Double (x !! 0))
    where
      x = xs state
      tVal = t state
