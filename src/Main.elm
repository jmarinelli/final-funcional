module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, style, type_, class, src)
import Html.Events exposing (onClick)

import Actions exposing (..)
import Header exposing (..)
import Models exposing (..)
import SearchBar exposing (..)
import HotelResults exposing (..)
import HotelFilters exposing (..)
import HotelListConnector exposing (..)

main =
  Html.program { init = init
              , subscriptions = subscriptions
              , update = update
              , view = view }

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- MODEL

model : Model
model =
  { hotels = []
  , errors = ""
  , appliedFilters =
    { checkin = ""
    , checkout = ""
    , stars = 0
    , name = "" } }

init : ( Model, Cmd Msg )
init =
  ( model, Cmd.none )

-- VIEW

withStyle html =
  div []
  [ node "style" [type_ "text/css"]
    [text "@import url(main.css)"]
  , html
  ]

view : Model -> Html Msg
view model =
    div []
      [
        text model.errors,
        Header.view,
        SearchBar.view model,
        div [ class "columnsContainer" ]
        [
          HotelFilters.view model,
          HotelResults.view model
        ]
      ]
    |> withStyle
