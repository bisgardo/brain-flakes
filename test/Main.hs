module Main (main) where

import Test.Hspec
import InstructionSpec

main :: IO ()
main = hspec $ do
  instructionSpec
