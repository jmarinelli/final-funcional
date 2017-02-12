module HotelResults exposing (..)

import HotelFilters exposing (..)
import Actions exposing (..)
import Models exposing (..)
import Utils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (width, height, href, style, type_, class, src)
import Html.Events exposing (onClick)

hotelRef : String -> String -> String -> String
hotelRef slug checkin checkout =
  "https://almundo.com.ar/hotels/detail/" ++ slug ++ "?date=" ++ checkin ++ "," ++ checkout ++ "&rooms=2"

renderAmenity : String -> Html Msg
renderAmenity amenity =
  case amenity of
    "bar" ->
      renderImage20 "bar.png"
    "internet" ->
      renderImage20 "wifi.png"
    "housekeeping" ->
      renderImage20 "hk.png"
    "air-condition" ->
      renderImage20 "ac.png"
    _ ->
      text ""

renderHotelImage : String -> Html Msg
renderHotelImage image =
  div [ class "box-hotel-item box-hotel-avatar" ] [ renderImage ("http:" ++ image) 160 320 ]

renderHotelDescription : Hotel -> Html Msg
renderHotelDescription hotel =
  div [ class "box-hotel-item box-hotel-description" ]
    [
      div [ class "hotel-title" ] [ text hotel.name ],
      div [ class "hotel-description" ] [ text (capitalize hotel.regime) ],
      div [ class "hotel-description" ] (List.map renderAmenity hotel.amenities)
    ]

renderHotelPrice : Hotel -> Filters -> Html Msg
renderHotelPrice hotel filters =
  div [ class "box-hotel-item box-hotel-price" ]
  [
    text "Precio por noche por habitación",
    div [ class "price" ] [ text ("ARS " ++ (toString hotel.price)) ],
    div [] [ text "Impuestos y tasas no incluidos" ],
    br [] [],
    a [ href (hotelRef hotel.slug filters.checkin filters.checkout), class "button-hotel" ] [ text "COMPRAR" ]
  ]

renderHotel : Filters -> Hotel -> Html Msg
renderHotel filters hotel =
  div [ class "box-hotel" ]
    [
      (renderHotelImage hotel.image),
      (renderHotelDescription hotel),
      (renderHotelPrice hotel filters)
    ]

view : Model -> Html Msg
view model =
  div [] [
    div [ class "leftColumn" ]
      (List.map (renderHotel model.appliedFilters) (HotelFilters.applyFilters model.appliedFilters model.hotels))
  ]
