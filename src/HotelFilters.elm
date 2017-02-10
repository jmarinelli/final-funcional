module HotelFilters exposing (..)

import Models exposing (..)
import Actions exposing (..)
import Html exposing (..)
import Html.Attributes exposing (name, checked, placeholder, value, method, style, type_, class, src)
import Html.Events exposing (onClick, onInput)

-- Model

filterByName : String -> List Hotel -> List Hotel
filterByName name hotels =
  if name == "" then
    hotels
  else
    List.filter (\h -> String.contains name h.name ) hotels

filterByStars : Int -> List Hotel -> List Hotel
filterByStars stars hotels =
  if stars == 0 then
    hotels
  else
    List.filter (\h -> round h.stars == stars) hotels

applyFilters : Filters -> List Hotel -> List Hotel
applyFilters filters hotels =
  filterByName filters.name (filterByStars filters.stars hotels)

-- View

starsFilter : Model -> Html Msg
starsFilter model =
  div [ class "filter" ]
  [
    label [] [text "Estrellas"],
    radio 0 True " Todos ",
    radio 5 False " * * * * * ",
    radio 4 False " * * * * ",
    radio 3 False " * * * ",
    radio 2 False " * * ",
    radio 1 False " * "
  ]

radio : Int -> Bool -> String -> Html Msg
radio msg check lbl =
  div [] [
    br [] [],
    input [ name "stars-filter", type_ "radio", checked check, onClick (Stars msg) ] [],
    text lbl
  ]

hotelNameFilter : Model -> Html Msg
hotelNameFilter model =
  div [ class "filter" ]
  [
    form [ method "post" ]
    [
      label [] [text "Nombre del hotel"],
      br [] [],
      input [ placeholder "Nombre del hotel", onInput HotelName ] []
    ]
  ]

view : Model -> Html Msg
view model =
  div [ class "filterColumn" ]
  [
    h2 [] [ text "Filtrar" ],
    hotelNameFilter model,
    starsFilter model
  ]
