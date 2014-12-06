module Main where

main = do
    putStrLn . show . calcFib $ 4000000

fib :: Int -> Int
fib 1 = 1
fib 2 = 2
fib x = fib (x - 1) + fib (x - 2)

calcFib :: Int -> Int
calcFib end = sum $ filter even $ takeWhile (<= end) $ map fib [1..]
