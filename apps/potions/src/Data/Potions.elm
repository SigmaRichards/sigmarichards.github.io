module Data.Potions exposing ( .. )

import List
import Dict

import Data.Effects exposing ( Effect, getEffect )
import Data.Ingredients exposing ( Ingredient, getIngredient )
import Data.PotionsRaw exposing ( potionRaw )

 -- potionRaw : List (String, List (List String))

type alias Formula = List Ingredient

type alias Potion =
  { name : String
  , formulae : List Formula
  }

parseFormula : List String -> List Ingredient
parseFormula = List.map getIngredient

parsePotion : (String, List (List String)) -> Potion
parsePotion (s, fs) =
  { name = s
  , formulae = List.map parseFormula fs
  }

potionsData : Dict.Dict String Potion
potionsData =
  let parser (s, fs) = (s, parsePotion (s, fs))
  in
    Dict.fromList <| List.map parser potionRaw
