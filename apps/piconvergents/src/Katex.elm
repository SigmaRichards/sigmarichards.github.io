module Katex exposing (inline, display)

import Html as H
import Html.Attributes as A

katex : String -> Bool -> H.Html msg
katex tex displayMode =
  case displayMode of
    True -> H.node "math-katex" [ A.attribute "texstring" tex, A.attribute "displaymode" "true" ] []
    _    -> H.node "math-katex" [ A.attribute "texstring" tex, A.attribute "displaymode" "false" ] []

inline : String -> H.Html msg
inline tex = H.span [] [ katex tex False]

display : String -> H.Html msg
display tex = H.div [ A.style "text-align" "center" ] [ katex tex True ]
