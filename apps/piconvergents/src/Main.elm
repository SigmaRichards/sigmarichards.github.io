module Main exposing (main)

import Html as H
import Html.Events as E
import Html.Attributes as A
import Browser as B

import Katex as K
import Pi

 -- Model
type alias Model = List (String, String, String)

getTex : (String, String, String) -> H.Html msg
getTex (n, d, f) = K.display ("\\frac{" ++ n ++ "}{" ++ d ++ "}\\approx " ++ f)

init : () -> ( Model, Cmd Msg)
init _ = ([], Cmd.none)

 -- Page Elements
texContinuedFraction : String
texContinuedFraction =
  "\\pi = \\frac{4}{1 + \\frac{1^2}{3 + \\frac{2^2}{5 + \\frac{3^2}{7 + \\frac{4^2}{9 + \\ddots}}}}}"


header : H.Html Msg
header = H.h1 [] [ H.text "Rational Convergent Generator for ", K.inline "\\pi" ]

description : H.Html Msg
description = H.p []
  [ H.text "Silly little convergent generator for "
  , K.inline "\\pi"
  , H.text ". The method is a continued fraction method, and the n"
  , H.sup [] [ H.text "th" ]
  , H.text " fraction is taken by taking the first 'n' numerators."
  , H.text "The chosen continued fraction is: "
  , K.display texContinuedFraction
  , H.br [] []
  , H.text "Start generating convergents by clicking the button below. "
  , H.text "This was designed as a test project to learn the basics of using Elm. "
  , H.text "As a result of implementation details and other decisions the performance can be quite poor. "
  , H.text "After a few convergents are generated it will noticeably take some time to process."
  ]

button : H.Html Msg
button = H.div [ A.style "text-align" "center" ] [ H.button [ E.onClick Next ] [ H.text "Generate next convergent" ] ]

preamble : List (H.Html Msg)
preamble =
  [ header
  , description
  , H.br [] []
  , button
  , H.br [] []
  ]

 -- Update
type Msg
  = Next

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Next -> ( (Pi.piSFromN (List.length model + 1)) :: model , Cmd.none )

view : Model -> B.Document Msg
view model = 
  { title = ""
  , body = preamble ++ (List.map getTex model |> (List.intersperse (H.br [] [])))
  }

subscriptions : model ->  Sub msg
subscriptions _ = Sub.none

main : Program () Model Msg
main = 
  B.document
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
