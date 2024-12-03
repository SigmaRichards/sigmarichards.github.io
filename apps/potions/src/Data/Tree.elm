module Data.Tree exposing ( .. )

import Dict

type DataTree comparable v
  = NullTree
  | RootNode (Dict.Dict comparable (DataTree comparable v))
  | DataNode v (Dict.Dict comparable (DataTree comparable v))

getTreeNode : DataTree comparable v -> comparable -> DataTree comparable v
getTreeNode tree k =
  case tree of
    NullTree   -> NullTree
    RootNode d ->
      case Dict.get k d of
        Just new -> new
        _        -> NullTree
    DataNode _ d ->
      case Dict.get k d of
        Just new -> new
        _        -> NullTree

getTreeNodeR : DataTree comparable v -> List comparable -> DataTree comparable v
getTreeNodeR root ks =
  case root of
    NullTree -> NullTree
    _        ->
      case ks of
        []       -> root
        (k::rem) -> getTreeNodeR (getTreeNode root k) rem

updateTreeNode : DataTree comparable v -> comparable -> v -> DataTree comparable v
updateTreeNode tree k v =
  let
    updateOld node val =
      case node of
        NullTree     -> DataNode val (Dict.fromList [])
        RootNode d   -> DataNode val d
        DataNode _ d -> DataNode val d
    old = getTreeNode tree k
    new = updateOld old v
  in
    case tree of
      NullTree      -> RootNode    <| Dict.fromList [(k, new)]
      RootNode d    -> RootNode    <| Dict.insert k new d
      DataNode cv d -> DataNode cv <| Dict.insert k new d

updateTreeNodeR : DataTree comparable v -> List comparable -> v -> DataTree comparable v
updateTreeNodeR tree ks v =
  let
    updateOld node val =
      case node of
        NullTree     -> DataNode val (Dict.fromList [])
        RootNode d   -> DataNode val d
        DataNode _ d -> DataNode val d
  in
    case ks of
      [] -> updateOld tree v
      (k::rem) ->
        let
          nodeRem = updateTreeNodeR (getTreeNode tree k) rem v
        in
          case tree of
            NullTree     -> RootNode   <| Dict.singleton k nodeRem
            RootNode d   -> RootNode   <| Dict.insert k nodeRem d
            DataNode o d -> DataNode o <| Dict.insert k nodeRem d

listThing : List a -> List (a, List a) 
listThing vs =
  let
    grouper i v = (v, (List.take i vs) ++ (List.drop (i+1) vs))
  in 
    List.indexedMap grouper vs

updateTreeNodeSymmetricR : DataTree comparable v -> List comparable -> v -> DataTree comparable v
updateTreeNodeSymmetricR tree ks v =
  let
    update node val =
      case node of
        NullTree     -> DataNode val (Dict.fromList [])
        RootNode d   -> DataNode val d
        DataNode _ d -> DataNode val d
    process (k, rem) node =
      let
        nodeRem = updateTreeNodeSymmetricR (getTreeNode node k) rem v
      in
        case node of
          NullTree     -> RootNode   <| Dict.singleton k nodeRem
          RootNode d   -> RootNode   <| Dict.insert k nodeRem d
          DataNode o d -> DataNode o <| Dict.insert k nodeRem d
  in
    case ks of
      [] -> update tree v
      _  ->
        List.foldr process tree <| listThing ks

getDictM : DataTree comparable v -> Maybe (Dict.Dict comparable (DataTree comparable v))
getDictM node =
  case node of
    NullTree     -> Nothing
    RootNode d   -> Just d
    DataNode _ d -> Just d

getDict : DataTree comparable v -> Dict.Dict comparable (DataTree comparable v)
getDict node =
  case (getDictM node) of
    Just d -> d
    _      -> Dict.empty

getValueM : DataTree comparable v -> Maybe v
getValueM node =
  case node of
    NullTree     -> Nothing
    RootNode _   -> Nothing
    DataNode v _ -> Just v


  
