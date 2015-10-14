module Main where

import Effects exposing (Never)
import Channel exposing (init, update, view)
import Message exposing (Message)
import StartApp
import Task

-- PORTS

port addMessage : Signal Message
port userJoin : Signal String
port userPart : Signal String

-- SIGNALS

messages : Signal Channel.Action
messages = Signal.map Channel.AddMessage addMessage

joining : Signal Channel.Action
joining = Signal.map Channel.UserJoin userJoin

parting : Signal Channel.Action
parting = Signal.map Channel.UserPart userPart

-- APP

app =
  StartApp.start
    { init = init "#Dogirc"
    , update = update
    , view = view
    , inputs =
      [ messages
      , joining
      ,parting
      ]
    }

main =
  app.html

port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
