module SolverEquations where

  import Prelude
  import SolverTypes

  -- Exponential : y = A * exp(-t)
  -- y' = -y

  -- x0' = -x0
  eq_exponential :: Equation
  eq_exponential state    = [-x !! 0]
    where
      x = xs state



  -- Sine : y = A * sin(omega * t)
  -- y'' = -y

  -- x0' = x1
  -- x1' = -x0
  eq_sine :: Equation
  eq_sine state    = [x0,x1]
    where
      x = xs state
      x0 = x !! 1
      x1 = - (x !! 0)



  -- Hyperbolic cosine : y = a*cosh((x - b)/a)
  -- y' = sqrt(y^2 - a^2)/a

  -- x0' = sqrt(x0^2 - a^2)/a
  eq_cosh :: Equation
  eq_cosh state = [x0]
    where
      x = xs state
      x0 = sqrt((x !! 0)^2 - a^2)
      a = 0.99
