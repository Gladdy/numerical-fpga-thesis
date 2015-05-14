module Solver where

  import Prelude
  import SolverTypes
  import SolverHelper
  import SolverPlotter

  -- EQUATIONS
  -- x0' = -x0
  dx :: Equation
  dx state    = [-x !! 0]
    where
      x = xs state


  -- x0' = x1
  -- x1' = x0
  sineEQ :: Equation
  sineEQ state    = [x0,x1]
    where
      x = xs state
      x0 = x !! 1
      x1 = - (x !! 0)

  -- SOLVERS
  -- EULER
  euler :: SolveMethod
  euler time equation initState   = ODEState newX newT
    where
      newX = zipWith (+) (xs initState) dX
      dX = map (timestep *) (equation initState)
      newT = (t initState) + timestep
      timestep = dt time

  -- RUNGE KUTTA 4th ORDER
  rk4 :: SolveMethod
  rk4 time equation initState = ODEState newX newT
    where
      newX = zipWith (+) (xs initState) dX
      dX = map (timestep/6*) (sumLists [k1,k2,k3,k4] [1,2,2,1])
      k1 = equation initState
      k2 = equation $ ODEState (sumLists [oldX, k1] [1, 0.5*timestep]) halfT
      k3 = equation $ ODEState (sumLists [oldX, k2] [1, 0.5*timestep]) halfT
      k4 = equation $ ODEState (sumLists [oldX, k3] [1, timestep]) newT

      newT = oldT + timestep
      halfT = oldT + timestep/2

      timestep = dt time
      oldX = xs initState
      oldT = t initState

  ---- CALLERS
  -- general form, stop after a certain time
  solve :: SolveMethod -> TimeSettings -> Equation -> ODEState  -> [ODEState]
  solve solvemethod time equation initState
    | end = []
    | otherwise = initState : solve solvemethod time equation newState
    where
      newState = solvemethod time equation initState
      end = (t initState) > (tMax time)

  initODEState = ODEState [10, 0.0] 0.0
  initTimeSettings = TimeSettings 0.01 10

  solution1 = solve euler initTimeSettings dx initODEState
  solution2 = solve rk4 initTimeSettings sineEQ initODEState


  testPlot = plotSolutions [(solution1, "Exponential"),(solution2, "Sine")] "Some graphs!"
