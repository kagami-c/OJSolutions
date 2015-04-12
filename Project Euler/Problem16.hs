-- Problem 16, pass

module Main where

main = do
    putStrLn "Calculating..."
    putStrLn . show $ result
    where result = sum $ calcExpo2 1000

calcExpo2 :: Int -> [Int]
calcExpo2 1 = [2]
calcExpo2 e = 
    let preAns = calcExpo2 (e - 1)
        (calcList, carry) = lineMul2 preAns
    in  trunc0 (carry : calcList)

bitMul2 :: Int -> Int -> (Int, Int)
bitMul2 carry bit = 
    let s = carry + bit * 2
    in  (s `mod` 10, s `div` 10)

lineMul2 :: [Int] -> ([Int], Int)
lineMul2 [] = ([], 0)
lineMul2 (x:xs) = 
    let (tailList, carry) = lineMul2 xs
        (headResult, c) = bitMul2 carry x
    in  (headResult : tailList, c)

trunc0 :: [Int] -> [Int]
trunc0 [] = []
trunc0 (0:xs) = trunc0 xs
trunc0 l = l