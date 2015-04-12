-- Problem 19, pass

module Main where

main = do
    putStrLn "Calculating..."
    putStrLn . show $ result
    where result = fst . sumYearsTo $ 2000

getMonthDays :: Int -> Bool -> Int
getMonthDays month isLeapYear
    | month == 9 || month == 4 || month == 6 || month == 11 = 30
    | month == 2 = if isLeapYear then 29 else 28
    | otherwise = 31

calcFirstDay :: Bool -> Int -> Int -> (Int, Int)
calcFirstDay isLeapYear daysCounter month = (isSunday, nextCounter)
    where isSunday = if daysCounter == 0 then 1 else 0
          nextCounter = (daysCounter + getMonthDays month isLeapYear) `mod` 7

sumMonths :: Bool -> Int -> Int -> (Int, Int)
sumMonths isLeapYear daysCounter 1 = calcFirstDay isLeapYear daysCounter 1
sumMonths isLeapYear daysCounter month = 
    let (sundaySum, counter) = sumMonths isLeapYear daysCounter (month - 1)
        (sundayThisMonth, nextCounter) = calcFirstDay isLeapYear counter month
    in  (sundaySum + sundayThisMonth, nextCounter)

sumYear :: Int -> Int -> (Int, Int)
sumYear year daysCounter = 
    let isLeapYear = year `mod` 4 == 0 && year `mod` 400 /= 0
    in  sumMonths isLeapYear daysCounter 12

sumYearsTo :: Int -> (Int, Int)
sumYearsTo 1901 = 
    let daysCount = snd $ sumYear 1900 0
    in  sumYear 1901 daysCount
sumYearsTo year = 
    let (sundaySum, counter) = sumYearsTo (year - 1)
        (sundayThisYear, nextCounter) = sumYear year counter
    in  (sundaySum + sundayThisYear, nextCounter)
