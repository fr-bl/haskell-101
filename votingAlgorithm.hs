{-
    Voting Algorithmus

    Der Algorithmus soll eine Liste von Abstimmungsergenissen auswerten und am Ende den Gewinner ausgeben.

    votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

    --> [(1, "Green"), (2, "Red"), (3, "Blue")]

    --> "Blue" 
-}


--Abstimmung zur Lieblingsprogrammiersprache im LK
votesPL :: [String]
votesPL = ["Haskell", "TypeScript", "Rust", "Python", "Brainfuck", "Brainfuck", "DreamBerd", "DreamBerd", ['D', 'r', 'e', 'a', 'm', 'b', 'e', 'r', 'd']]


{-
    Die Funktion count bekommt eine Auswahlmoeglichkeit und eine Liste von Abstimmungsergebnissen
    und zaehlt dann, wie oft diese Moeglichkeit gewaehlt wurde, z.B.

    > count "Red" votes 
    2
-}

--Hilfsfunktion fuer count: Zaehlt die Elemente einer Liste
myLength :: [x] -> Int
myLength [] = 0
myLength (x:xs) = myLength xs + 1

--Hilfsfunktion fuer count: Filtert eine Liste mittels Praedikat
myFilter :: (x -> Bool) -> [x] -> [x]
myFilter p xs = [x | x <- xs, p x]

count :: Eq x => x -> [x] -> Int
count x xs = myLength (myFilter (==x) xs)

{-
    Fuer jede Auswahlmoeglichkeit sollen die Anzahl der Stimmen berechnet werden.
    Dafuer benoetigt man eine Liste mit den Auswahlmoeglichkeiten bzw. eine Liste der Ergebnisse ohne Duplikate.

    Idee: Fuege das erste Element vorne an eine Ergebnisliste und rufe dann die Funktion rekursiv 
    fuer die gefilterte Restliste, also ohne erneute Vorkommen dieses Elements auf.

    > rmdupls votes
    ["Red", "Blue", "Green"]
-}
rmdupls :: Eq x => [x] -> [x]
rmdupls [] = []
rmdupls (x:xs) = x : rmdupls (myFilter (/=x) xs)



{-
    Die Funktion result berechnet fuer jede Auswahlmoeglichkeit die Anzahl (-> count) der Stimmen.
    Das Ergebnis soll ueber List Comprehension als Liste von Tupeln in aufsteigender Reihenfolge ausgegeben werden, z.B.:

    > result votes
    [(1, "Green"), (2, "Red"), (3, "Blue")]
-}
result :: Eq x => [x] -> [(Int, x)]
result xs = [(count x xs, x) | x <- rmdupls xs]


{-
    Gibt das groesste Listenelement aus.
    Prueft rekursiv fuer jedes Listenelement, ob es groesser als der Wert von curMax ist:
    Falls ja, rufe die Funktion mit diesem Listenelement als neuem curMax auf.
-}

--Hilfsfunktion fuer winner: Gibt den ersten Wert eines Tupels zurueck.
myFst :: (a, b) -> a
myFst (a, b) = a

myMax :: (Int, x) -> [(Int, x)] -> (Int, x)
myMax curMax [] = curMax
myMax curMax (x:xs) | myFst x > myFst curMax = myMax x xs
                    | otherwise = myMax curMax xs

{-
    Die Funktion winner ruft die Funktion result aus und gibt dann den Namen des Gewinners aus, z.B.:

    > winner votes
    "Blue"
-}

--Hilfsfunktion fuer winner: Gibt den zweiten Wert eines Tupels zurueck.
mySnd :: (a, b) -> b
mySnd (a, b) = b

winner :: Eq x => [x] -> x
winner xs = mySnd (myMax (0, head xs) (result xs))
