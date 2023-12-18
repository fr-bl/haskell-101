import Data.Char

kubikzahlen :: [Integer]
kubikzahlen = [x ^ 3 | x <- [1..5]]

ungerade :: [Integer]
ungerade = [x | x <- [1..19], x `mod` 2 == 1]

fibo :: Integer -> Integer
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-2) + fibo (n-1) 

fibonacci :: [Integer]
fibonacci = [fibo x | x <- [0..9]]

kartesisch :: [(Integer, Integer)]
kartesisch = [(x, y) | x <- [1..3], y <- [3..4]]

let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n char | isLower char = int2let ((let2int char + n) `mod` 26)             
             | isUpper char = toUpper (shift n (toLower char))
             | otherwise = char

encode :: Int -> String -> String
encode n str = [shift n char | char <- str]

decode :: Int -> String -> String
decode n str = encode (-n) str
