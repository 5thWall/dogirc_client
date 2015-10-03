module Channel where

import Html exposing (..)
import Html.Attributes exposing (..)
import Effects exposing (Effects)

-- MODEL

type alias Channel =
  { name : String
  , messages : List String
  }

init : String -> (Channel, Effects.Effects Action)
init name =
  ({ name = name, messages = []}, Effects.none)

-- UPDATE

type Action = AddMessage String

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
  div [ class "ui bottom attached active tab segment" ]
    (List.map messageItem channel.messages)

messageItem : String -> Html
messageItem message =
  p [] [ text message ]
