module Main where

import Effects exposing (Never)
import Channel exposing (init, update, view)
import Message exposing (Message)
import StartApp
import Task
import Signal exposing ((<~))


port addMessage : Signal Message

messages : Signal Channel.Action
messages = Channel.AddMessage <~ addMessage

app =
  StartApp.start
    { init = init "#Dogirc"
    , update = update
    , view = view
    , inputs = [messages]
    }

main =
  app.html

port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
