-- Problem 17, pass

module Main where

main = do
    putStrLn "Calculating..."
    putStrLn . show $ result
    where result = calcTo 1000

calcTo :: Int -> Int
calcTo end = sum $ map (length . toWord) $ take end [1..]

toWord :: Int -> String
toWord 0 = ""
toWord 1 = "one"
toWord 2 = "two"
toWord 3 = "three"
toWord 4 = "four"
toWord 5 = "five"
toWord 6 = "six"
toWord 7 = "seven"
toWord 8 = "eight"
toWord 9 = "nine"
toWord 10 = "ten"
toWord 11 = "eleven"
toWord 12 = "twelve"
toWord 13 = "thirteen"
toWord 14 = "fourteen"
toWord 15 = "fifteen"
toWord 16 = "sixteen"
toWord 17 = "seventeen"
toWord 18 = "eighteen"
toWord 19 = "nineteen"
toWord 20 = "twenty"
toWord 30 = "thirty"
toWord 40 = "forty"
toWord 50 = "fifty"
toWord 60 = "sixty"
toWord 70 = "seventy"
toWord 80 = "eighty"
toWord 90 = "ninety"
toWord 1000 = "one" ++ "thousand"
toWord num
    | num < 100  = 
        let remain = num `mod` 10 
        in  toWord (num - remain) ++ toWord remain
    | num < 1000 = 
        let remain = num `mod` 100
            hundred = (num - remain) `div` 100
            middle = if remain == 0 then "" else "and"
        in  toWord hundred ++ "hundred" ++ middle ++ toWord remain
