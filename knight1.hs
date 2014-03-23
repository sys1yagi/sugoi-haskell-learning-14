module Knight2 where

import Control.Monad

type KnightPos = (Int, Int)

moveKnight :: [KnightPos] -> [[KnightPos]]
moveKnight [(c,r)] = do
    (c', r') <- [(c+2, r-1), (c+2, r+1), (c-2, r-1), (c-2, r+1)
        ,(c+1, r-2), (c+1, r+2), (c-1, r-2), (c-1, r+2)]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return [(c', r'),(c,r)]
moveKnight (x:xs) = map (++xs) (moveKnight [x])

allRoute3 :: KnightPos -> [[KnightPos]]
allRoute3 x = do
    first <- moveKnight [x]
    second <- moveKnight first
    moveKnight second

route3 :: KnightPos -> KnightPos -> [[KnightPos]]
route3 s e = [reverse y | y <- allRoute3 s, head y == e ]
    
a = route3 (6,2) (6,1)
b = route3 (6,2) (3,2)
c = route3 (6,2) (3,1)

main = do
    print a
    print "-------------------"
    print b
    print "-------------------"
    print c