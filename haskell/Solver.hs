
module Solver where

  import Prelude
  import SolverTypes

  import SolverEquations
  import SolverSolvers
  import SolverPlotter
  import SolverPresets

  ---- CALLERS
  -- general form, stop after a certain time
  solve :: Solver
  solve solvemethod time equation initState = states
    where
      states = take steps $ iterate (solvemethod time equation) initState
      steps = ceiling $ (tMax time - t initState)/dt time

  sol_start = solve rk4 initTimeSettings

  solution_expo = sol_start eq_exponential initODEState
  solution_sine = sol_start eq_sine initODEState
  solution_cosh = solve rk4 initTimeSettings2 eq_cosh initODEState2
  solution_homo = sol_start (eq_linear_homo_const sinematrix) initODEState2
  solution_hetr = sol_start (eq_linear_hetr_const sinematrix funcvec) initODEState2

<<<<<<< HEAD
  
  testPlot = plotSolutions [s1,s2,s3,s4,s5] "Some graphs!"
=======

  testPlot = plotSolutions [s1,s2,s3,s4,s5] "Haskell solver examples"
>>>>>>> origin/master
    where
      s1 = (solution_expo, "Exponential")
      s2 = (solution_sine, "Sine")
      s3 = (solution_cosh, "Cosh")
      s4 = (solution_homo, "Matrix form - homogenous")
      s5 = (solution_hetr, "Matrix form - heterogenous")
  
