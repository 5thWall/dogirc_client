module Message where

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Message =
  { nick: String
  , message: String
  }

view : Message -> Html
view message =
  p []
  [ span [ class "nick" ] [ text (message.nick ++ ":") ]
  , span [ class "message" ] [ text message.message ]
  ]
