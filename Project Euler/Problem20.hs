-- Problem 20, pass

module Main where

main = do
    putStrLn "Calculating..."
    putStrLn . show $ result
    where result = sum . divIntoList $ fac 1 100

-- Just use BigInt (Integer)
fac :: Integer -> Integer -> Integer
fac factor 0 = factor
fac baseFactor n = fac (baseFactor * n) (n - 1)

divIntoList :: Integer -> [Integer]
divIntoList 0 = []
divIntoList bigInt = divIntoList (bigInt `div` 10) ++ [bigInt `mod` 10]