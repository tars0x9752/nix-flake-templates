module Main
  ( cp
  , main
  ) where

import Prelude

import Data.Enum (fromEnum)
import Data.Int (hexadecimal, toStringAs)
import Data.String (CodePoint, codePointFromChar)
import Effect (Effect)
import Effect.Console (log)

cp ∷ CodePoint
cp = codePointFromChar '青'

cpStr ∷ String
cpStr =
  let
    intOfCp = fromEnum cp
  in
    "0x" <> toStringAs hexadecimal intOfCp

main :: Effect Unit
main = do
  log ("Hello I'm " <> "tars" <> cpStr)
  log "This is a PureScript template"
