module HotelListConnector exposing (..)

import Utils exposing (..)
import Models exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)
import Http
import Task

fetchHotels : String -> String -> Cmd Msg
fetchHotels checkin checkout =
  let
    url = "https://almundo.com.ar/hotels/async/1282466/hotels?rooms=2&type=CITY&date=" ++ checkin ++ "," ++ checkout
  in
    Http.send FetchSuccess (Http.get url decodeResponse)

decodeResponse : Decoder (List Hotel)
decodeResponse =
  at ["hotels"] (list hotelDecoder)

hotelDecoder : Decoder Hotel
hotelDecoder =
  map7 Hotel
    (field "name" string)
    (field "stars" float)
    (at [ "rate", "price", "show_amount_per_night_per_room" ] float)
    (at [ "images", "0", "url" ] string)
    (at [ "rate", "meal_plan", "description" ] string )
    (at [ "amenities" ] (list amenityDecoder) )
    (field "slug" string)

amenityDecoder : Decoder String
amenityDecoder =
  field "code" string
