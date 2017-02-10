module Actions exposing (..)

import HotelListConnector exposing (..)
import Models exposing (..)
import Html exposing (..)

updateStars : Int -> Filters -> Filters
updateStars starsSelected filters =
  { filters | stars = starsSelected }

updateName : String -> Filters -> Filters
updateName nameSelected filters =
  { filters | name = nameSelected }

updateCheckin : String -> Filters -> Filters
updateCheckin selectedDate filters =
  { filters | checkin = selectedDate }

updateCheckout : String -> Filters -> Filters
updateCheckout selectedDate filters =
  { filters | checkout = selectedDate }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Stars stars ->
      ( { model | appliedFilters = updateStars stars model.appliedFilters }, Cmd.none )
    HotelName hotelName ->
      ( { model | appliedFilters = updateName hotelName model.appliedFilters }, Cmd.none )
    Checkin selectedDate ->
      ( { model | appliedFilters = updateCheckin selectedDate model.appliedFilters }, Cmd.none )
    Checkout selectedDate ->
      ( { model | appliedFilters = updateCheckout selectedDate model.appliedFilters }, Cmd.none )
    FetchHotels ->
      ( model, HotelListConnector.fetchHotels model.appliedFilters.checkin model.appliedFilters.checkout )
    FetchSuccess (Ok hotelList) ->
      ( { model | hotels = hotelList }, Cmd.none )
    FetchSuccess (Err error) ->
      ( { model | errors = (toString error) }, Cmd.none )
