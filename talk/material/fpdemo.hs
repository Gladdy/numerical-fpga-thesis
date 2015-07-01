fib :: Integral a => a -> a
fib n | n == 0    = 1
      | n == 1    = 1
      | otherwise = fib (n-2) + fib (n-1) 

fib_list :: Integral a => a -> [a]
fib_list n = map fib [0..n]

choose_list :: Integral a => (a -> a) -> [a]
choose_list function = map function [0..]

sum_list :: Integral a => [a] -> a
sum_list list = foldl (+) 0 list 