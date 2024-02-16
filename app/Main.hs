module Main where

import Instruction

main :: IO ()
main = do
  input <- getContents
  let instrs = parse (1, 1) input
  putStrLn "Instructions:"
  putStrLn $ show instrs
