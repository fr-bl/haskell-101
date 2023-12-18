rest :: [Int] -> [Int]
rest (x:xs) = xs

myHead :: [Int] -> Int
myHead (x:xs) = x

addFirst :: Int -> [Int] -> [Int]
addFirst x arr = x : arr

mySum :: [Int] -> Int
mySum (x:y:[]) = x + y
mySum (x:y:xs) = mySum (x + y:xs)

mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum(xs)


calcMyLenght :: [Int] -> Int -> Int
calcMyLenght (x:[]) len = len+1
calcMyLenght (x:xs) len = calcMyLen xs len+1
myLength :: [Int] -> Int
myLength xs = calcMyLen xs 0


myLength :: [Int] -> Int
myLength (x:[]) = 1
myLength (x:xs) = (myLength xs) + 1

myReverse :: [Int] -> [Int]
myReverse [] = []
myReverse [x:xs] = myReverse xs ++ [x]
