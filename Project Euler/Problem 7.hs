module Main where

main = do
    putStrLn "Calculating the 10001th prime"
    putStrLn . show . takePrime $ 10001

calcFactor :: Int -> [Int]
calcFactor num = [ a | a <- [2 .. truncate (sqrt $ fromIntegral num)], num `mod` a == 0]

isPrime :: Int -> Bool
isPrime num = if (length . calcFactor $ num) >= 1
                then False
                else True

takePrime :: Int -> Int
takePrime num = last $ take num $ filter isPrime [2..]
