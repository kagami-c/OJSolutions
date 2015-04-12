-- Problem 24, pass

module Main where

import Data.List

main = do
    putStrLn "Calculating..."
    putStrLn . show $ getAns 1000000

fac :: Int -> Int -> Int
fac s 1 = s
fac s n = fac (s * n) (n - 1)

calc :: Int -> Int -> Int -> [Int] -> [Int]
calc _ 0 _ [] = error "Error"
calc end beginIndex sums digitList
    | nextSums > end  = calc end (beginIndex - 1) sums digitList
    | nextSums == end = newDigits
    | otherwise       = calc end beginIndex nextSums newDigits
    where nextSums = fac 1 beginIndex + sums
          newDigits = countDigits digitList (9 - beginIndex)

countDigits :: [Int] -> Int -> [Int]
countDigits [] _ = []
countDigits digitList index = 
    if index == 0
    then (head digitList + 1) : countDigits (tail digitList) (index - 1)
    else (head digitList) : countDigits (tail digitList) (index - 1)

getAns :: Int -> [Int]
getAns end = let rawDigits = calc end 9 1 $ take 10 $ repeat 0
             in  transDigits rawDigits [0..9]

transDigits :: [Int] -> [Int] -> [Int]
transDigits [] _ = []
transDigits rawDigits digits = 
    let aimDigit = digits !! (head rawDigits)
    in  aimDigit : transDigits (tail rawDigits) (delete aimDigit digits)