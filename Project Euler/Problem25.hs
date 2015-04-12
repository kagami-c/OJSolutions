-- Problem 25, pass

module Main where

main = do
    putStrLn "Calculating..."
    putStrLn . show $ result
    where fibWithIndex = zip [1..] fib
          result = fst . head $ dropWhile ((dropOrNot 1000) . snd) fibWithIndex

fib :: [Integer]
fib = 1 : 1 : zipWith (+) fib (tail fib)

judgeLength :: Integer -> Integer -> Integer
judgeLength num acc = 
    if num `div` 10 == 0
    then acc + 1
    else judgeLength (num `div` 10) (acc + 1)

getLength :: Integer -> Integer
getLength num = judgeLength num 0

dropOrNot :: Integer -> Integer -> Bool
dropOrNot end num = 
    if getLength num < end
    then True
    else False
