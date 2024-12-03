module Main exposing ( main )

import Debug

import Dict
import Maybe
import Browser

import Html as H
import Html.Events as HE
import Html.Attributes as HA

import Data.Tree as Tree
import Data.Potions exposing ( Potion, Formula, potionsData ) 
import Data.PotionTree exposing ( potionTree, potionCountTree, PotionTree, PCountTree )
import Data.Merchants exposing ( getMerchant )
import Data.MerchantsByIngredient exposing ( merchantByIngredientData )

type alias Model = List String
init : Model
init = []

type Msg
  = AddEffect    String
  | RemoveEffect String
  | Reset
  | NoMsg

update : Msg -> Model -> Model
update msg model =
  let
    ensureNotIn s = 
      List.filter (\v -> v /= s) model
  in
    case msg of
      NoMsg          -> model
      Reset          -> init
      AddEffect s    ->
        s :: (ensureNotIn s)
      RemoveEffect s -> 
        ensureNotIn s

flip : (a -> b -> c) -> b -> a -> c
flip f b a = f a b

makeCheckbox : (Bool -> Msg) -> Bool -> String -> H.Html Msg
makeCheckbox onCheck isChecked s =
  H.div []
    [ H.input [ HE.onCheck onCheck, HA.type_ "checkbox", HA.checked isChecked ] []
    , H.label [] [ H.text s ]
    ]

effectCheckbox : String -> Model -> H.Html Msg
effectCheckbox s model =
  let
    onCheck isNowChecked =
      if isNowChecked
        then AddEffect s
        else RemoveEffect s
    isChecked = List.member s model
  in
    makeCheckbox onCheck isChecked s

listifyHtml : List (H.Html Msg) -> List (H.Html Msg)
listifyHtml l = l
  |> List.map (List.singleton)
  |> List.map (H.li [])

listifyOHtml : List (H.Html Msg) -> H.Html Msg
listifyOHtml l = l
  |> listifyHtml
  |> H.ol []

listifyUHtml : List (H.Html Msg) -> H.Html Msg
listifyUHtml l = l
  |> listifyHtml
  |> H.ul []

viewState : Model -> H.Html Msg
viewState model =
  List.map H.text model
    |> (::) (H.text "Effects: ")
    |> List.intersperse (H.br [] [])
    |> H.div []

view : Model -> H.Html Msg
view model = H.div [] 
  [ H.h1 [] [ H.text "Silly Morrowind Potions" ]
  , viewPotionBuilder model
  ]

viewPotionBuilder : Model -> H.Html Msg
viewPotionBuilder model = H.span [] [ H.table [ HA.style "width" "100%" ] 
  [ H.tr []
      [ H.td [ HA.style "vertical-align" "top", HA.style "width" "33%" ] [ getCheckboxes model ]
      , H.td [ HA.style "vertical-align" "top", HA.style "width" "33%" ] [ viewFormulae  model ]
      , H.td [ HA.style "vertical-align" "top", HA.style "width" "33%" ] [ viewMerchants model ]
      ]
  --, H.tr [] [ H.td [] [ viewState model ] ]
  ]]

countLeadingZeros : List Int -> Int
countLeadingZeros vs =
  case vs of
    []    -> 0
    v::rem -> 
      if (v == 0)
        then 1 + (countLeadingZeros rem)
        else 0

splitByCount : PCountTree -> Dict.Dict Int (List String)
splitByCount tree =
  let
    updateFunc v ml =
      case ml of
        Just l -> Just (v::l)
        _      -> Just ([v])
    getZeroCount vs =
      case vs of
        Just v -> countLeadingZeros v
        _      -> 0
    insertAppend (k, v) d =
      Dict.update (Tree.getValueM v |> getZeroCount) (updateFunc k) d
    val = tree 
      |> Tree.getDict
      |> Dict.toList
      |> List.foldr (insertAppend) (Dict.empty)
  in
    val

listM ml =
  case ml of
    Just l -> l
    _      -> []

splitCheckboxes : Model -> Dict.Dict Int (List String) -> H.Html Msg
splitCheckboxes model numR =
  let
    getCountGroup ind =
      Dict.get ind numR 
        |> listM 
        |> List.map (flip effectCheckbox model)
        |> listifyUHtml
        |> List.singleton
        |> (::) (H.text <| "Requires " ++ (String.fromInt ind) ++ " additional effect(s): ")
        |> H.div []
    maxInd = 
      case (Dict.keys numR |> List.maximum) of
        Just v -> v
        _      -> 0
  in
    List.range 0 maxInd 
      |> List.map getCountGroup
      |> List.intersperse (H.br [] [])
      |> H.div []

getCheckboxes : Model -> H.Html Msg
getCheckboxes model = 
  let
    node   = Tree.getTreeNodeR potionTree model
    nodeC  = Tree.getTreeNodeR potionCountTree model
    countM = nodeC |> Tree.getValueM
    countL =
      case countM of
        Just l -> l
        _      -> []
    countS = countL
      |> List.map String.fromInt
      |> List.take 1
      |> String.join ""
    numRequired = splitByCount nodeC
    available = splitCheckboxes model numRequired
    selected = List.map (flip effectCheckbox model) model
      |> listifyUHtml 
      |> List.singleton
      |> H.div []
  in
    H.div []
      [ H.text "Selected: "
      , selected
      , H.text <| "Number of formulae: " ++ countS
      , H.br [] []
      , H.br [] []
      , H.text "Available: "
      , available
      ]

viewFormula : Formula -> H.Html Msg
viewFormula f =
  let
    totalValue = List.map (\i->i.value) f |> List.sum
    iString {name, value} = name ++ " (" ++ (String.fromInt value) ++ ")"
    ingElem = List.map iString f
      |> List.map (H.text)
      |> listifyUHtml
      |> List.singleton
      |> H.div []
    valElem = H.div [] 
      [ H.text <| "Total value: " ++ (String.fromInt totalValue)
      ]
  in
    H.div []
      [ H.div [] 
        [ H.text "Ingredients:"
        , ingElem
        ]
      , valElem
      ]

unique : List comparable -> List comparable
unique l =
  let
    uStep v ls =
      if (List.member v ls)
        then ls
        else v::ls
  in
    List.foldr uStep [] l

viewFormulae : Model -> H.Html Msg
viewFormulae model = 
  let
    node = Tree.getTreeNodeR potionTree model
    valM = Tree.getValueM node
    {name, formulae} = 
      case valM of
        Just p -> p
        _      -> {name = "Invalid potion", formulae = []}
  in
    H.div []
      [ H.text ("Potion Name: " ++ name)
      , H.br [] []
      , H.text "Formulae: "
      , H.br [] []
      , ( List.map viewFormula formulae 
            |> listifyHtml
            |> List.intersperse (H.br [] [])
            |> H.ol []
        )
      ] 
viewMerchants : Model -> H.Html Msg
viewMerchants model =
  let
    node = Tree.getTreeNodeR potionTree model
    valM = Tree.getValueM node
    {name, formulae} = 
      case valM of
        Just p -> p
        _      -> {name = "Invalid potion", formulae = []}
    outM mMI =
      case mMI of
        Just (_, mi) -> mi
        _            -> []
    uniqueIngredients = formulae
      |> List.map (List.map (\a->a.name))
      |> List.concat 
      |> unique
    uniqueMerchants = uniqueIngredients
      |> List.map (\i->Dict.get i merchantByIngredientData |> outM)
      |> List.concat
      |> List.map (\i->i.name)
      |> unique
    showMerchant m = getMerchant m
      |> .ingredients
      |> List.filter (\(a,b)->List.member a.name uniqueIngredients)
      |> List.map (\(a,b)->a.name ++ " (" ++ (String.fromInt b) ++ ")")
      |> List.map H.text
      |> listifyUHtml
      |> List.singleton
      |> (::) (H.text m)
      |> H.div []
    showMerchants = uniqueMerchants
      |> List.map showMerchant
      |> listifyUHtml
  in
    H.div []
      [ H.text "Merchants:"
      , showMerchants
      ]

main = Browser.sandbox {init = init, update = update, view = view}
