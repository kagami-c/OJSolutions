-- Problem 23， pass

-- Should use Set rather than List, when List is big

module Main where

import Data.List
import qualified Data.Set as Set

main = do
    putStrLn "Calculating..."
    putStrLn . show $ result
    where abNums = allAbNums 28123
          result = sum $ filterNAbs (Set.fromList [1..28123]) abNums abNums

checkDiv :: Int -> Int -> [Int]
checkDiv checkNum candidate = 
    if checkNum `mod` candidate == 0
    then [candidate, checkNum `div` candidate]
    else []

loopCandidate :: Int -> Int -> Set.Set Int
loopCandidate num 1 = Set.fromList [1]
loopCandidate num candidate = 
    let thisRun = Set.fromList $ checkDiv num candidate
    in  Set.union thisRun $ loopCandidate num (candidate - 1)

divisorSum :: Int -> Int
divisorSum num = 
    sum . Set.toList $ loopCandidate num $ (floor . sqrt . fromIntegral $ num)

allAbNums :: Int -> [Int]
allAbNums end = 
    [ num | num <- [12..end], divisorSum num > num ]

filterNAbs :: Set.Set Int -> [Int] -> [Int] -> Set.Set Int
filterNAbs rawSet [] [] = rawSet
filterNAbs rawSet (a:as) (b:bs) = 
    let thisRun = map (+a) $ takeWhile (<= (28123 - a)) (b:bs)
        setFormat = Set.fromList thisRun
    in  filterNAbs (Set.difference rawSet setFormat) as bs
