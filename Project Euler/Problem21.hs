-- Problem 21, pass

module Main where

import Data.List

main = do
    putStrLn "Calculating..."
    putStrLn . show $ result
    where result = calcAllAmicable 10000

checkDiv :: [Int] -> Int -> Int -> [Int]
checkDiv divisorsList checkNum divisorCandidate = 
    if checkNum `mod` divisorCandidate == 0
    then divisorCandidate : divisorsList
    else divisorsList

loopCandidate :: Int -> Int -> [Int]
loopCandidate num 0 = []
loopCandidate num candidate = 
    let divisorsList = loopCandidate num (candidate - 1)
    in  checkDiv divisorsList num candidate

properDivisors :: Int -> [Int]
properDivisors num = loopCandidate num (num - 1)

mapDivisorsSum :: [Int] -> [(Int, Int)]
mapDivisorsSum rawList = [ (x, sum $ properDivisors x) | x <- rawList ]

findAmicable :: [(Int, Int)] -> [(Int, Int)]
findAmicable mapList = [ a | a <- mapList, b <- mapList, 
    fst a /= fst b, fst a == snd b, snd a == fst b ]

calcAllAmicable :: Int -> Int
calcAllAmicable end = 
    sum . map (fst) $ findAmicable . mapDivisorsSum $ [1..end]