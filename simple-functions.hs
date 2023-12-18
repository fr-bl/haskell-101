{- 
    Programm mit selbst definierten Funktionen
    (AB Funktionsdefinitionen)
-}

--Aufgabe 1: fortyTwo
--Die Funktion gibt immer 42 zurueck.
fortytwo :: Int
fortytwo = 43


--Aufgabe 2: square
--Berechnet das Quadrat einer Zahl.
square :: Integer -> Integer
square x = x ^ 2


--Aufgabe 3: greaterZero
--Überprüft, ob eine Zahl größer als null ist.
greaterZero :: Integer -> Bool
greaterZero x = x > 0


--Aufgabe 4: bmi
--Berechnet de Bodymassindex einer Person.
bmi :: Float -> Float -> Float 
bmi gewicht groesse = (gewicht / groesse) ** 2


--Aufgabe 5: firstLetter
--Ermittelt den ersten Buchstaben eines Strings.
firstLetter :: [Char] -> Char
firstLetter s = s!!0


--Aufgabe 5: secondLetter
--Ermittelt den zweiten Buchstaben eines Strings.
secondLetter :: [Char] -> Char
secondLetter s = s!!1

--Aufgabe 6: hello 
--eine Funktion, die einen Nammen fordert und diesen dann begrüßt
hello :: [Char] -> [Char]
hello name = "Hallo " ++ name
