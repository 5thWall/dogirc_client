module Channel where

import Html exposing (..)
import Html.Attributes exposing (..)
import Effects exposing (Effects)
import Message exposing (Message)

-- MODEL

type alias User = String

type alias Channel =
  { name : String
  , messages : List Message
  , users : List User
  }

init : String -> (Channel, Effects.Effects Action)
init name =
  ({ name = name, messages = [], users = ["Andy", "Bob", "Fred"]}, Effects.none)

-- UPDATE

type Action = AddMessage Message

update : Action -> Channel -> (Channel, Effects.Effects Action)
update action model =
  case action of
    AddMessage message ->
      ({ model | messages <- model.messages ++ [ message ] }, Effects.none)

-- VIEW

view : Signal.Address Action -> Channel -> Html
view address model =
    div []
      [ channelTab model
      , channelView model
      ]

channelTab : Channel -> Html
channelTab channel =
  div [ class "ui top attached tabular menu" ]
    [ div [ class "active item"] [ text channel.name ] ]

channelView : Channel -> Html
channelView channel =
  div [ class "ui bottom attached active tab segment grid" ]
    [ div [ class "thirteen wide column messages" ] (List.map Message.view channel.messages)
    , div [ class "right floated two wide column userlist" ] (List.map userView channel.users)
    ]

userView : User -> Html
userView user =
  p [] [ text user ]
