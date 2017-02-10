module SearchBar exposing (..)

import Actions exposing (..)
import Models exposing (..)
import Utils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (href, placeholder, class, src)
import Html.Events exposing (onClick, onInput)

view : Model -> Html Msg
view model =
  div [class "results"] [
    text "Buscar hoteles para:",
    renderDateInput Checkin,
    renderDateInput Checkout,
    a [ href "#", class "button-hotel", onClick FetchHotels ] [ text "BUSCAR" ]
  ]

renderDateInput : (String -> Msg) -> Html Msg
renderDateInput msg =
  span [class "date-field"] [
    renderCalendar,
    input [ class "date-input", placeholder "YYYY-MM-DD", onInput msg ] []
  ]

renderCalendar : Html Msg
renderCalendar =
  img [src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAMAAAAMCGV4AAAAQlBMVEUAAABERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERESjerhkAAAAFXRSTlMAAQUGCAskJjBNUFaDiJueorDBxdqKAPQLAAAAWElEQVQIW53JQRKCIABA0QcBSmqZyP2v2qJhctGqt/vzYZ7ANANx31JKKW17hKV/3XFc+kC7dENby7A2tCoHWcjqp0MvuefSQ/39DX/183wN5wO3ugw1egOz1wdS4/K1AgAAAABJRU5ErkJggg=="][]
