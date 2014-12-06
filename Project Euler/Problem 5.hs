module Main where

import Data.Monoid
import Data.List

main = do
    putStrLn "Calculating the product"
    putStrLn . show $ calcProduct 20

calcFactor :: Int -> [Int]
calcFactor num = [ a | a <- [2..num], num `mod` a == 0]

isPrime :: Int -> Bool
isPrime num = if (length . calcFactor $ num) > 1
                then False
                else True

calcPrimeFactors :: Int -> [Int] -> [Int]
calcPrimeFactors 1 _ = []
calcPrimeFactors num list = 
    let element = head list
    in  if num `mod` element == 0
            then element:(calcPrimeFactors (num `div` element) list)
            else calcPrimeFactors num (tail list)

allPrime :: Int -> [Int]
allPrime num = filter isPrime [2..num]

-- list1 \\ list2
-- this function will delete each element of list2 in list1
-- and can deal with element's quantity
addFactors :: [Int] -> [Int] -> [Int]
addFactors old new = sort $ old ++ (new \\ old)

allFactors :: Int -> [Int]
allFactors num = 
    let allResults = [ calcPrimeFactors a $ allPrime a | a <- [2..num] ]
    in  foldl addFactors mempty allResults

calcProduct :: Int -> Int
calcProduct num = product $ allFactors num