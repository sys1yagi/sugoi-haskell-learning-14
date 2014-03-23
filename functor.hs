{-# LANGUAGE NoMonomorphismRestriction #-}
module Functor where
import Control.Applicative
import Data.Either

result1 = fmap (+5) [1,2,3,4,5]

result2 = fmap (/4) $ Just 5
result3 = fmap (*3) Nothing

either1 = fmap (++" Haskell!") (Left 1::Either Int String)
either2 = fmap (++" Haskell!") (Right "Great"::Either Int String)

operator = (*3) <$> [2,3,4,5,6]

f = fmap (+4)
g = f $ Just 5

main = do
    print result1
    print result2
    print result3
    print either1
    print either2
    print operator
    print g
