
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

  sol_start = solve rk4 initTimeSettings

  solution_expo = sol_start eq_exponential initODEState
  solution_sine = sol_start eq_sine initODEState
  solution_cosh = solve rk4 initTimeSettings2 eq_cosh initODEState2
  solution_homo = sol_start (eq_generate [[0,1],[-1,0]]) initODEState2

  testPlot = plotSolutions [s1,s2,s3,s4] "Some graphs!"
    where
      s1 = (solution_expo, "Exponential")
      s2 = (solution_sine, "Sine")
      s3 = (solution_cosh, "Cosh")
      s4 = (solution_homo, "Matrix form")
