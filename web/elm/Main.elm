module Main where

import Effects exposing (Never)
import Channel exposing (init, update, view)
import Message exposing (Message)
import StartApp
import Task
import Signal exposing ((<~))


port addPrivmsg : Signal Message.Msg
port addAction  : Signal Message.Msg

privmsgs : Signal Message
privmsgs = Message.Privmsg <~ addPrivmsg

actions : Signal Message
actions = Message.Action <~ addAction

messages : Signal Channel.Action
messages = Channel.AddMessage <~ (Signal.merge privmsgs actions)

app =
  StartApp.start
    { init = init "#DogIRC"
    , update = update
    , view = view
    , inputs = [messages]
    }

main =
  app.html

port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
