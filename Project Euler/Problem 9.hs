module Main where

main = do
    putStrLn "Calculating"
    putStrLn . show $ answer
    where resultList = [ [a, b, c] | b <- [1..1000], a <- [1..b], let c = 1000 - a - b, a ** 2 + b ** 2 == c ** 2 ]
          answer = product $ map truncate $ head resultList