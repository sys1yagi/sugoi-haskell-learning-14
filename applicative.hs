module ApplicativeFunctor where
import Control.Applicative

    
a = pure 4 :: Maybe Int

c = Just (*4) <*> Just 5

main = do
    print a
    print c