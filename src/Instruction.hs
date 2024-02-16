module Instruction where

data Positioned a = Positioned Position a deriving (Eq, Show)

type Position = (Int, Int)

data Instruction
  = Move Direction
  | Increment
  | Decrement
  | Output
  | Input
  | Jump Direction
  deriving (Eq, Show)

data Direction = Forward | Backward deriving (Eq, Show)

parse :: Position -> String -> [Positioned Instruction]
parse pos@(line, column) input =
  case input of
    "" -> []
    x : xs ->
      let (pos', instr) =
            if x == '\n'
              then ((line + 1, 1), Nothing)
              else ((line, column + 1), Positioned pos <$> m x)
          rest = parse pos' xs
       in case instr of
            Nothing -> rest
            Just i -> i : rest
  where
    m = \case
      '>' -> Just (Move Forward)
      '<' -> Just (Move Backward)
      '+' -> Just Increment
      '-' -> Just Decrement
      '.' -> Just Output
      ',' -> Just Input
      '[' -> Just (Jump Forward)
      ']' -> Just (Jump Backward)
      _ -> Nothing -- all other symbols are ignored
