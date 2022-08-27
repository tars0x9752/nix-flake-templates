module Main where

fzbz :: Int -> String
fzbz num = case (num `mod` 3, num `mod` 5) of
  (0, 0) -> "FizzBuzz"
  (0, _) -> "Fizz"
  (_, 0) -> "Buzz"
  (_, _) -> show num

main :: IO ()
main = do
  mapM_ (putStrLn . fzbz) [1 .. 20]
