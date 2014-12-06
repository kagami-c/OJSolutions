module Main where

main = do
    putStrLn "Solve largest prime factor\nPlease input the number"
    line <- getLine
    putStrLn . show . calcProcess . read $ line

calcFactor :: Int -> [Int]
calcFactor num = [ a | a <- [2 .. truncate (sqrt $ fromIntegral num)], num `mod` a == 0]

isPrime :: Int -> Bool
isPrime num = if (length . calcFactor $ num) >= 1
                then False
                else True

calcProcess :: Int -> Int
calcProcess num = last $ filter isPrime $ calcFactor num