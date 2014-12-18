module Main where

main = do
    putStrLn "Calculating"
    putStrLn . show $ result
    where result = last . last $ matrix 20 20 20

matrix :: Int -> Int -> Int -> [[Int]]
matrix s 0 n = [ take (n + 1) (repeat 1) ]
matrix s n 0 = matrix s (n - 1) s ++ [ [ 1 ] ]
matrix s a b = init m ++ [ last m ++ [ m !! (a - 1) !! b + m !! a !! (b - 1) ] ]
    where m = matrix s a (b - 1)
