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


 -- Mixed text delimiting
type MixedStr 
  = NStr String
  | ITex String
  | DTex String

renderMixedStr : MixedStr -> H.Html msg
renderMixedStr m =
  case m of
    NStr s -> H.text s
    ITex s -> inline s
    DTex s -> display s

type Delimeter = Delim String String

splitOnDelimeter : String -> String -> (String, String)
splitOnDelimeter d s =
  case s of
    "" -> ( "", "" )
    _  -> 
      if String.startsWith d s
        then
          let len = String.length d
          in ( String.left len s, String.dropLeft len s )
        else
          let ( l, r ) = splitOnDelimeter d (String.dropLeft 1 s)
          in ( (String.left 1 s) ++ l, r )

type Tri
  = TTrue0
  | TTrue1
  | TFalse

startsWith2 : String -> String -> String -> Tri
startsWith2 d0 d1 str =
  if String.startsWith d0 str
    then TTrue0
    else 
      if String.startsWith d1 str
        then TTrue1
        else TFalse

splitOnDelimeter2 : String -> String -> String -> (String, ( Tri, String ))
splitOnDelimeter2 dA dB str =
  if str == ""
    then ( "", (TFalse, "") )
    else
      case (startsWith2 dA dB str) of
        TTrue0 -> ( "", ( TTrue0, String.dropLeft (String.length dA) str ) )
        TTrue1 -> ( "", ( TTrue1, String.dropLeft (String.length dB) str ) )
        TFalse -> 
          let (l, r) = splitOnDelimeter2 dA dB (String.dropLeft 1 str)
          in ( (String.left 1 str) ++ l, r )

 -- parse mixed math and normal text strings, into list of elements
parseMixedText : Delimeter -> Delimeter -> String -> List MixedStr
parseMixedText (Delim iS iE) (Delim dS dE) str =
  if str == ""
    then []
    else
      case (splitOnDelimeter2 dS iS str) of
        (norm, (TTrue0, rem)) ->
          let 
            (l, r) = splitOnDelimeter dE rem
            normL = (if norm == "" then [] else [NStr norm])
          in normL ++ [DTex l] ++ (parseMixedText (Delim iS iE) (Delim dS dE) r)
        (norm, (TTrue1, rem)) ->
          let 
            (l, r) = splitOnDelimeter iE rem
            normL = (if norm == "" then [] else [NStr norm])
          in normL ++ [ITex l] ++ (parseMixedText (Delim iS iE) (Delim dS dE) r)
        (norm, (TFalse, _)) -> 
          [NStr norm]

mixedTextToHtml : List MixedStr -> List (H.Html msg)
mixedTextToHtml l = List.map renderMixedStr l
