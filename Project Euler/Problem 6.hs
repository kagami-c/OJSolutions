module Main where

main = do
    putStrLn "Calculating the sum of products"
    putStrLn . show $ calc

calcLine :: Int -> Int -> Int
calcLine end begin = foldl (+) 0 $ map (* begin) [(begin + 1) .. end]

calcBlock :: Int -> Int -> Int
calcBlock end begin = foldl (+) 0 $ map (calcLine end) [begin .. (end - 1)]

calc :: Int
calc = calcBlock 100 1 * 2