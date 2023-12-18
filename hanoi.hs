{- Simulation der Türme von Hanoi -}

hanoi :: Int -> [Char] -> [Char] -> [Char] -> [([Char], [Char])]

hanoi 1 start target support = [(start, target)]
hanoi n start target support = hanoi (n-1) start support target
    ++ hanoi 1 start target support
    ++ hanoi (n-1) support target start
