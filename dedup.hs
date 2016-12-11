import Data.List

dedupInternal :: [Int] -> Int -> [Int]
dedupInternal [] p = []
dedupInternal (x:xs) p
  | x == p = (dedupInternal xs x)
  | otherwise = (x:dedupInternal xs x)

dedup :: [Int] -> [Int]
dedup l = dedupInternal l 0

main = do
  let letras = [1, 1, 1, 3, 3, 3, 1, 1, 6, 6, 6]
  print (dedup letras)
