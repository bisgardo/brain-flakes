module Main (main) where

import InstructionSpec
import Test.Hspec

main :: IO ()
main = hspec $ do
  instructionSpec
