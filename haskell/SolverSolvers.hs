module SolverSolvers where

  import Prelude
  import SolverTypes
  import SolverHelper

  -- SOLVERS
  -- EULER
  euler :: SolveMethod
  euler time equation initState   = ODEState newX newT
    where
      newX      = zipWith (+) (xs initState) dX
      dX        = map (timestep *) (equation initState)
      newT      = (t initState) + timestep
      timestep  = dt time


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
