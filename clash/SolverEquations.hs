module SolverEquations where

  import CLaSH.Prelude
  import SolverTypes

  decoupledDecrease :: Equation
  decoupledDecrease state = map (*0.01) (xs state)