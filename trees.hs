data Tree k v = EmptyTree | Node k v (Tree k v) (Tree k v) deriving (Show, Read, Eq)

insert :: Ord(k) => k -> v -> Tree k v -> Tree k v
insert k v EmptyTree =  Node k v EmptyTree EmptyTree
insert k v (Node kt vt left right)
    | k == kt = Node k v left right
    | k < kt  = Node kt vt (insert k v left) right
    | k > kt  = Node kt vt left (insert k v right)

get :: (Ord k) => k -> Tree k v -> Maybe v
get k EmptyTree = Nothing
get k (Node kt vt left right)
    | k == kt = Just vt
    | k < kt  = get k left
    | k > kt  = get k right

deleteSmallest :: (Ord k) => Tree k v -> Maybe (k,v,Tree k v)
deleteSmallest EmptyTree = Nothing
deleteSmallest (Node kt vt left right) =
  case deleteSmallest left of Nothing -> Just (kt,vt,right)
                              Just (ks,vs,ts) -> Just (ks,vs,(Node kt vt ts right))

delete :: (Ord k) => k -> Tree k v -> Tree k v
delete k EmptyTree = EmptyTree
delete k (Node kt vt left right)
  | k == kt = case deleteSmallest right of Nothing -> left
                                           Just (ks,vs,ts) -> (Node ks vs left ts)
  | k < kt = Node kt vt (delete k left) right
  | k > kt = Node kt vt left (delete k right)

isIdentical :: (Ord k, Ord v) => Tree k v -> Tree k v -> Bool
isIdentical EmptyTree EmptyTree = True
isIdentical (Node k1 v1 l1 r1) EmptyTree = False
isIdentical EmptyTree (Node k2 v2 l2 r2) = False
isIdentical (Node k1 v1 l1 r1) (Node k2 v2 l2 r2)
    | k1 == k2 && v1 == v2 = isIdentical l1 l2 && isIdentical r1 r2
    | otherwise = False

main = do
  let a1 = insert 'a' 1 EmptyTree
      b1 = insert 'b' 2 a1
      c1 = insert 'e' 3 b1
      d1 = insert 'd' 1 c1

      a2 = insert 'a' 1 EmptyTree
      b2 = insert 'b' 2 a2
      c2 = insert 'e' 3 b2
      d2 = insert 'd' 1 c2
      e2 = insert 'c' 1 d2
      f2 = delete 'a' e2

  print d1
  print e2
  print f2
  print (isIdentical d1 e2)
