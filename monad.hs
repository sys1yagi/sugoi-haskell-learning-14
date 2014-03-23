module Monad where
import Control.Monad

a = return 10 :: Maybe Int

b = Just 5 >>= (\x -> Just (x + 6))
c = Nothing >>= (\x -> Just (x + 6))
d = Just 5 >>= (\x -> Just (x + 6)) >>= (\x -> Just (x + 7))

addLimit100 :: Int -> Int -> Maybe Int
addLimit100 a b = if ((a + b) > 100) then Nothing else Just (a + b)

e = Just 10 >>= addLimit100 20
f = Just 100 >>= addLimit100 20

g = Just 10 >>= addLimit100 10 >>= addLimit100 10
h = do 
    a <- Just 10
    b <- addLimit100 10 a
    Just b
    
isOverLimit :: [Int] -> Maybe Int
isOverLimit [] = Just 0
isOverLimit (x:xs) = isOverLimit xs >>= addLimit100 x

i = isOverLimit [1,2,3,4,5,6,7,8,9,10]
j = isOverLimit [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]


isOverLimit2 :: [Int] -> Maybe Int
isOverLimit2 x = (\y -> if y > 100 then Nothing else Just y) $ foldr (+) 0 x
k = isOverLimit2 [1,2,3,4,5,6,7,8,9,10]
l = isOverLimit2 [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

-----

m = isOverLimit $ reverse [1,100,-10]
n = isOverLimit2 $ reverse [1,100,-10]

main = do
    print "return----------------"
    print a
    print "bind------------------"
    print b
    print c
    print d
    print "func------------------"
    print e
    print f
    print g
    print "do--------------------"
    print h
    print "func2"
    print i
    print j
    print "no monad"
    print k
    print l
    print "diff"
    print m
    print n