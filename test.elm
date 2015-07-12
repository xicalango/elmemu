import Html exposing (text, span)

testRecord =
  {
   subRecord = { x=0, y=0 }
  }
  
showBool b =
         case b of
           True -> "True"
           False -> "False"

main : Html.Html
main = span [] [text ((outOfBounds (.subRecord testRecord)) |> toString), Html.br [] [text "blal"], text "bla"]
