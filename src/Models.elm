module Models exposing (..)

import Http

type Msg = Stars Int | HotelName String | Checkin String | Checkout String | FetchHotels | FetchSuccess ( Result Http.Error (List Hotel) )

type alias Hotel =
  { name : String
  , stars : Float
  , price : Float
  , image : String
  , regime : String
  , amenities : List String }

type alias Filters =
  { checkin: String
  , checkout: String
  , stars : Int
  , name : String }

type alias Model =
  { hotels : List Hotel
  , errors : String
  , appliedFilters : Filters }
