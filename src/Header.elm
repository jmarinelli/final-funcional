module Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, href)

view =
  header []
  [
    nav [ class "navbar-menu" ]
    [
      div [ class "pull-left" ] [ img [ class "menu-logo", src "http://www.asiawebdirect.com/images/hotels-com.png" ] [] ],
      ul []
      [
        li [] [ a [] [text "Hoteles en Buenos Aires"] ]
      ]
    ]
  ]
