module Main where

import Data.List
import Data.Monoid

main = do
    putStrLn "Calculating"
    putStrLn . show $ result
    where triangleList = scanl1 (+) [1..]
          result = head $ dropWhile (check 500) triangleList

calcDivisor :: Int -> [Int]
calcDivisor num = mconcat $ map (addDivisor num) [1 .. truncate (sqrt $ fromIntegral num)]

addDivisor :: Int -> Int -> [Int]
addDivisor num a
    | remain == 0 = if a == q then [a] else [a, q]
    | otherwise   = []
    where remain = num `mod` a
          q = num `div` a

check :: Int -> Int -> Bool
check quantity num = length (calcDivisor num) <= quantity

-- answer: 76576500
-- this method is accurate