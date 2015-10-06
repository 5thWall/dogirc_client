module Message where

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Msg =
  { nick: String
  , message: String
  }

type Message = Privmsg Msg | Action Msg

view : Message -> Html
view message =
  case message of
    Privmsg msg -> viewPrivmsg msg
    Action msg  -> viewAction msg

viewPrivmsg : Msg -> Html
viewPrivmsg message =
  p [ class "privmsg" ]
  [ span [ class "nick" ] [ text (message.nick ++ ":") ]
  , span [ class "message" ] [ text message.message ]
  ]

viewAction : Msg -> Html
viewAction message =
  p [ class "action" ]
  [ span [ class "nick" ] [ text (message.nick ++ ":") ]
  , span [ class "message" ] [ text message.message ]
  ]
