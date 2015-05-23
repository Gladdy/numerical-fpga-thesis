module Solver where

  import Prelude
  import SolverTypes

  import SolverEquations
  import SolverSolvers
  import SolverPlotter


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
  initODEState2 = ODEState [1, 0.0] 0.0

  initTimeSettings = TimeSettings 0.01 10
  initTimeSettings2 = TimeSettings 0.01 3


  solution_exponential = solve euler initTimeSettings eq_exponential initODEState
  solution_sine = solve rk4 initTimeSettings eq_sine initODEState
  solution_cosh = solve rk4 initTimeSettings2 eq_cosh initODEState2

  testPlot = plotSolutions [(solution_exponential, "Exponential"),(solution_sine, "Sine"),(solution_cosh, "Cosh")] "Some graphs!"
