-- Problem 22, pass

module Main where

import Data.Char
import Data.List

main = do
    putStrLn "Opening File..."
    inputStr <- readFile "names.txt"
    putStrLn "Calculating..."
    let result = processData inputStr
    putStrLn . show $ result

processData :: String -> Integer
processData str = 
    let namesGroup = map truncQuotes $ splitBy ',' str
    in  loopNamesGroup (sortBy compare namesGroup) 1

splitBy :: Char -> String -> [String]
splitBy c [] = []
splitBy c str = let (word, nextStr) = break (== c) str
                in  [word] ++ splitBy c (truncSpace $ dropWhile (== c) nextStr)

truncSpace :: String -> String
truncSpace str = dropWhile isSpace str

truncQuotes :: String -> String
truncQuotes str = 
    let truncHead = dropWhile (== '\"') str
    in  takeWhile isUpper truncHead

mapTable :: Char -> Integer 
mapTable c = fromIntegral (ord c) - 64

calcNameScore :: String -> Integer -> (Integer, Integer)
calcNameScore name counter = 
    let score = sum $ map mapTable name
    in  (score * counter, counter + 1)

loopNamesGroup :: [String] -> Integer -> Integer
loopNamesGroup [] _ = 0
loopNamesGroup (name:names) counter = 
    let (score, nextCounter) = calcNameScore name counter 
    in  score + loopNamesGroup names nextCounter