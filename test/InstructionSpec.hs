module InstructionSpec where

import Instruction
import Test.Hspec

instructionSpec = do
  describe "parse" $ do
    it "accepts all commands" $ do
      (parse (1, 1) "><+-.,[]") `shouldBe` [Positioned (1, 1) $ Move Forward, Positioned (1, 2) $ Move Backward, Positioned (1, 3) $ Increment, Positioned (1, 4) $ Decrement, Positioned (1, 5) $ Output, Positioned (1, 6) $ Input, Positioned (1, 7) $ Jump Forward, Positioned (1, 8) $ Jump Backward]
    it "accepts repeated commands" $ do
      (parse (1, 1) ">>+<<") `shouldBe` [Positioned (1, 1) $ Move Forward, Positioned (1, 2) $ Move Forward, Positioned (1, 3) $ Increment, Positioned (1, 4) $ Move Backward, Positioned (1, 5) $ Move Backward]
    it "ignores non-commands" $ do
      (parse (1, 1) "a<b+c>!") `shouldBe` [Positioned (1, 2) $ Move Backward, Positioned (1, 4) $ Increment, Positioned (1, 6) $ Move Forward]
