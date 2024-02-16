module Main where

import Control.Monad (when)
import Instruction (parse)
import System.Environment (getArgs)
import System.Exit (die)

main :: IO ()
main = do
  args <- getArgs
  when (null args) $
    die "Error: No command-line arguments provided."
  let path = args !! 0
  input <- readFile path
  let instrs = parse (1, 1) input
  putStrLn "Instructions:"
  putStrLn $ show instrs
