module Main exposing (main)

import Html as H
import Html.Events as E
import Html.Attributes as A
import Browser as B

import Katex as K

 -- Model
defaultTexString : String
defaultTexString = "\\Gamma(x) = \\frac{1}{4}\\times\\int_0^x e^{i\\pi u}\\,du"

parseText : String -> H.Html msg
parseText raw =
  let l = String.lines raw
  in H.div [] (List.map (K.display) l)

type alias Model =
  { texstring : String
  }

init : () -> ( Model, Cmd Msg)
init _ = update ( LatexChanged defaultTexString ) { texstring = "" }

 -- Preamble
header : H.Html msg
header = H.h1 [ ] [ K.inline "\\KaTeX", H.text " Math Renderer" ]

description : H.Html msg
description =
  H.p [] 
    [ H.text "On-demand rendering of Katex expressions. Enter your equation in the box below and get a rendering of the expression. "
    , H.text "View the Katex documentation "
    , H.a [ A.href "https://katex.org/" ] [ H.text "here" ]
    , H.text "."
    ]

textarea : Model -> H.Html Msg
textarea model = H.div [] [ H.textarea [ A.value model.texstring, A.rows 10, E.onInput LatexChanged ] [] ]

preamble : Model -> List (H.Html Msg)
preamble model =
  [ header
  , description
  , H.br [] []
  , textarea model
  , H.br [] []
  ]


 -- Update
type Msg
  = LatexChanged String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LatexChanged texstring -> ( { model | texstring = texstring}, Cmd.none )

view : Model -> B.Document Msg
view model = 
  { title = ""
  , body = preamble model ++ 
    [ parseText model.texstring
    ] 
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
