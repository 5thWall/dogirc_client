module Message where

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Message =
  { nick: String
  , message: String
  , kind: String
  }


view : Message -> Html
view message =
  p [ class message.kind ]
  [ span [ class "nick" ] [ text (message.nick ++ ":") ]
  , span [ class "message" ] [ text message.message ]
  ]
