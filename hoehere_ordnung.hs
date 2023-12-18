--Wendet eine gegebene Funktion auf alle Elemente einer Liste an.
myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = (f x):(myMap f xs)

--Wählt alle Elemente einer Liste aus, die ein gegebenes Prädikat p erfüllen.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p xs = [x | x <- xs, p x]

--Entscheidet, ob alle Elemente einer Liste ein Prädikat erfüllen.
myAll :: (a -> Bool) -> [a] -> Bool
myAll p xs = length (filter p xs) == length xs

--myAll _ [] = True
--myAll p (x:xs) = p x && myAll p xs

--Entscheidet, ob ein Element einer Liste ein Prädikat erfüllt.
myAny :: (a -> Bool) -> [a] -> Bool
myAny p xs = length (filter p xs) > 0

--myAny _ [] = False
--myAny p (x:xs) = p x || myAny p xs

--Nimmt die Elemente einer Liste, solange ein Prädikat erfüllt ist.
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile p (x:xs) | p x = x : myTakeWhile p xs
myTakeWhile _ xs = []

myTakeWhile _ [] = []
myTakeWhile p (x:xs) | p x = x : myTakeWhile p xs
                     | otherwise = []
                     
--Entferne Elemente von einer Liste, solange wie ein Prädikat erfüllt ist.
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile p (x:xs) | p x = myDropWhile p xs
myDropWhile _ xs = xs

myDropWhile _ [] = []
myDropWhile p (x:xs) | p x = myDropWhile p xs
                     | otherwise = x:xs

--luhnDouble
luhnDouble :: Int -> Int
luhnDouble n | n * 2 > 9 = n * 2 - 9
             | otherwise = n * 2

--altMap
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ [] = []
altMap f g (x:xs) = f x : altMap g f xs

altMap f g xs = [if even i then f (xs!!i) else g (xs!!i) | i <- [0..length xs - 1]]


--luhn
luhn :: [Int] -> Bool
luhn xs = sum (altMap (\a -> a) luhnDouble (reverse xs)) `mod` 10 == 0

luhn xs = sum (altMap (*1) luhnDouble (reverse xs)) `mod` 10 == 0
