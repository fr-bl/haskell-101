{-
	Mein erstes Skript
-}

--Additionsfunktion
add a b = a + b

--Verdopplungsfunktion
double n = n + n

--Summe Gauss
gauss n = (n * (n + 1)) `div` 2

--Negation
myNot a = not a

--Konjunktion
myAnd a b = a && b

--Disjunktion
myOr a b = a || b

--Negierte Konjunktion
nand a b = not (a && b)

main :: IO ()
main = do
  let a = 5
  let b = 3
  print (add a b)
  print (double a)
  print (gauss a)
  print (True `nand` False)
  
