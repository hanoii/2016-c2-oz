import Data.List
import Data.Ord

-------------------------------------- TDA : --------------------------------------
----- es de tipo : closed ( no se puede ver que dict contiene un [(Char,Integer)] )
-----              unbundled (se le pasa el tda a las funciones que operan sobre el)
-----             statelss (nunca muta el TDA)
data Dict =  Dict [(Char,Integer)] deriving (Show)

newDict :: Dict
newDict = Dict []

asList :: Dict -> [(Char,Integer)]
asList (Dict lista) =
  lista

_put :: Char -> Integer -> [(Char,Integer)] -> [(Char,Integer)]
_put key valor lista =
   (key,valor):(filter ((/=key).fst) lista)

put :: Char -> Integer -> Dict -> Dict
put letra frecuencia dict =
  Dict (_put letra frecuencia (asList dict))

_get :: Char -> [(Char,Integer)] -> Maybe Integer
_get a xs = find xs where
  find [] = Nothing
  find ((z,x):xs) | a == z    = Just x
              | otherwise = find xs

get :: Char -> Dict ->  Maybe Integer
get letra dict =
  _get letra (asList dict)

_domain :: [(Char,Integer)] -> [Char]
_domain lista =
  reverse (map fst (sortBy (comparing snd) (lista)))

domain :: Dict -> [Char]
domain dict =
  _domain (asList dict)


--------------------------- FIN TDA ------------------------------------------


-- funciones auxiliares
count   :: Eq a => a -> [a] -> Integer
count x =  genericLength . filter (==x)

insertInDic :: [Char] -> Dict -> Dict
insertInDic [] dict =
  dict
insertInDic (x:xs) dict =
  insertInDic  ( filter(/=x) xs) ( put x (count x (x:xs) ) dict)

--- fin funciones auxiliares

--- funcion respuesta al ej:
ordenarLetrasPorFrecuencia :: [Char] -> [Char]
ordenarLetrasPorFrecuencia letras =
  domain (insertInDic letras newDict)

main = do
  let letras = ['a','a','b','b','b','c','d','d','e','e','e','e','e']
  print (ordenarLetrasPorFrecuencia letras)
