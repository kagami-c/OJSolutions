module Main where

main = do
    putStrLn "Calculating"
    putStrLn . show . takePrimesAndSum $ 2000000

checkDivisible :: Integer -> [Integer] -> Bool
checkDivisible _ [] = False
checkDivisible num list = 
    if num `mod` (head list) == 0
        then True
        else checkDivisible num (tail list)

isPrime' :: Integer -> Bool
isPrime' num = not $ checkDivisible num [2 .. truncate (sqrt $ fromIntegral num)]

takePrimesAndSum :: Integer -> Integer
takePrimesAndSum num = foldl (+) 0 $ filter isPrime' [2..num]

-- snippet 
-- calculate prime
-- > nubBy (\x y -> x `mod` y == 0) [2..]
-- maybe can compare the efficiency of these 2 implementations