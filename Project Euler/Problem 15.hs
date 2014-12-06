-- UN-FINISHED

module Main where

main = do
    putStrLn "Calculating"
    putStrLn . show $ result
    where result = getList (Point 20 20) (Point 0 0)

data Point = Point Int Int deriving (Show, Eq)

getX :: Point -> Int
getX (Point x y) = x

getY :: Point -> Int
getY (Point x y) = y

-- border point, input point
getNextPoint :: Point -> Point -> [Point]
getNextPoint (Point bx by) (Point x y) = 
    let right = if x < bx then [Point (x+1) y] else []
        down = if y < by then [Point x (y+1)] else []
    in  right ++ down

goDownThePath :: [Int] -> Point -> Point -> Int
goDownThePath list endPoint beginPoint
    | deltaX == 0 || deltaY == 0 = 1
    | deltaX `elem` [1..4] = deltaS deltaX (deltaY + 1)
    | deltaY `elem` [1..4] = deltaS deltaY (deltaX + 1)
    | deltaX == deltaY && deltaX < length list = (reverse list) !! deltaX
    | otherwise = sum $ map (goDownThePath list endPoint) nextPoints
    where nextPoints = getNextPoint endPoint beginPoint
          deltaX = getX endPoint - getX beginPoint
          deltaY = getY endPoint - getY beginPoint

getList :: Point -> Point -> [Int]
getList endPoint beginPoint
    | endPoint == beginPoint = [1]
    | otherwise = goDownThePath lastList endPoint beginPoint : lastList
    where lastList = getList endPoint (Point (getX beginPoint + 1) (getY beginPoint + 1))

deltaS :: Int -> Int -> Int
deltaS 1 end = end
deltaS 2 end = sum [1..end]
deltaS order end = sum $ map (deltaS (order - 1)) [1..end]

-- not finish yet