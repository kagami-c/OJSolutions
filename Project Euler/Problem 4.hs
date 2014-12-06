module Main where

import Control.Applicative
import Data.List

main = do
    putStrLn "Calc Large Palindrome Number"
    putStrLn . show $ result

isPalindrome :: Int -> Bool
isPalindrome num = 
    let rawList = show num
        rList = reverse rawList
    in 
        if compare rawList rList == EQ
            then True
            else False

result :: Int
result = 
    let allResult = (*) <$> [100..999] <*> [100..999]
    in last $ sortBy compare $ filter isPalindrome allResult
