module Data.PotionTree exposing ( .. )

import List
import Dict
import String
import Basics.Extra exposing (flip)

import Data.Tree as Tree
import Data.Potions exposing ( Potion, potionsData )

type alias PotionTree = Tree.DataTree String Potion
type alias PCountTree = Tree.DataTree String (List Int)

potionTree : PotionTree
potionTree = 
  List.foldl (flip addPotionToTree) Tree.NullTree 
    <| Dict.values potionsData

addPotionToTree : PotionTree -> Potion -> PotionTree
addPotionToTree tree {name, formulae} =
  let
    keys = String.split "|" name
  in
    Tree.updateTreeNodeSymmetricR tree keys {name = name, formulae = formulae}

listElemWiseSum : List Int -> List Int -> List Int
listElemWiseSum xs ys =
  case xs of
    []    -> ys
    x::xr -> 
      case ys of
        []    -> xs
        y::yr -> (x+y) :: (listElemWiseSum xr yr)

elementWiseSum : List (List Int) -> List Int
elementWiseSum vvs =
  List.foldr listElemWiseSum [] vvs

treeCount : PotionTree -> PCountTree
treeCount root =
  let 
    getNestedCounts (k, t) =
      case t of
        Tree.NullTree     -> []
        Tree.RootNode d   -> [0]
        Tree.DataNode r d -> r
    dictMap v d = 
      let
        applied  = Dict.toList d |> List.map (\(k, t) -> (k, treeCount t)) 
        nCounts  = List.map getNestedCounts applied
        newCount = elementWiseSum nCounts
      in
        applied |> Dict.fromList |> Tree.DataNode (v::newCount)
  in
    case root of
      Tree.NullTree              -> Tree.NullTree
      Tree.RootNode d            -> dictMap 0 d
      Tree.DataNode {formulae} d -> dictMap (List.length formulae) d

potionCountTree : PCountTree
potionCountTree = treeCount potionTree

