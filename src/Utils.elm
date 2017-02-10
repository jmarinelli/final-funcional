module Utils exposing (..)

import Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (src, height, width)
import String exposing (left, dropLeft, toUpper)

renderImage20 : String -> Html msg
renderImage20 link = renderImage link 20 20

renderImage : String -> Int -> Int -> Html msg
renderImage link h w =
  img [ src link, height h, width w ] []

capitalize : String -> String
capitalize str =
  (left 1 >> toUpper) str ++ dropLeft 1 str
