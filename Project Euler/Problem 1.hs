module Main where

main = do
    putStrLn "Please input the ending number"
    line <- getLine
    putStrLn . show . calc . read $ line

calc :: Int -> Int
calc x = sum [ a | a <- [1..x], a `mod` 3 == 0 || a `mod` 5 == 0]
