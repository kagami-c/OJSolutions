module Main where

import Data.Function
import Data.List

main = do
    putStrLn "Calculating"
    putStrLn . show . calc $ 1000000

calcChain :: Int -> [Int]
calcChain 1 = [1]
calcChain n = n : calcChain next
    where next = if odd n then 3 * n + 1 else n `div` 2

mapFunc :: Int -> (Int, Int)
mapFunc num = (num, length . calcChain $ num)

calc :: Int -> Int
calc end = fst . last . sortBy (compare `on` snd) $ map mapFunc [2..end]