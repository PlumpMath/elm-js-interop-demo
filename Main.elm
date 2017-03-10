port module Main exposing (..)

import Html exposing (..)
import String exposing (toUpper)

-- Model

type alias Model =
  { line : String
  }

initialModel : Model
initialModel =
  { line = ""
  }

init : (Model, Cmd Msg)
init = (initialModel, Cmd.none)

-- Ports

port input : (String -> msg) -> Sub msg
port output : String -> Cmd msg

-- Update

type Msg = NewString String

update msg model =
  case msg of
    NewString line_ ->
      ({ model | line = line_ }, output (toUpper line_))

-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
  input NewString

-- View

view : Model -> Html Msg
view model = Html.text ""

-- App

main =
  Html.program
  {
    init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }
