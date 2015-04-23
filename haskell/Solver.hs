module Solver where

	import SolverTypes
	import SolverHelper

	-- EQUATIONS
	-- x0' = -x0
	dx :: Equation
	dx state 	= ODEState [-x !! 0] 0
				where
					x = xs state
	-- x0' = x1
	-- x1' = x0
	sineEQ :: Equation
	sineEQ state 	= ODEState [x0,x1] 0
					where
						x = xs state
						x0 = x !! 1
						x1 = - (x !! 0)

	-- SOLVERS
	euler :: SolveMethod
	euler time equation initState 	= ODEState newX newT
									where
										newX = zipWith (+) (xs initState) dX
										dX = (map (timestep *) (xs (equation initState)))
										newT = (t initState) + timestep
										timestep = dt time

	rk4 :: SolveMethod
	rk4 time equation initState = ODEState newX newT
								where
									newX = zipWith (+) (xs initState) dX
									dX = map (timestep/6*) (sumLists [(xs k1),(xs k2),(xs k3),(xs k4)] [1,2,2,1])
									k1 = equation initState
									k2 = equation $ ODEState (sumLists [oldX, (xs k1)] [1, 0.5*timestep]) halfT
									k3 = equation $ ODEState (sumLists [oldX, (xs k2)] [1, 0.5*timestep]) halfT
									k4 = equation $ ODEState (sumLists [oldX, (xs k3)] [1, timestep]) newT
 
									newT = oldT + timestep
									halfT = oldT + timestep/2
									
									timestep = dt time
									oldX = xs initState
									oldT = t initState

	---- calling
	solve :: SolveMethod -> TimeSettings -> Equation -> ODEState  -> [ODEState]
	solve solvemethod time equation initState  	
		| end = []
		| otherwise = initState : solve solvemethod time equation newState 
		where
			newState = solvemethod time equation initState 
			end = (t initState) > (tMax time)


	initODEState = ODEState [10, 0.0] 0.0
	initTimeSettings = TimeSettings 0.01 10