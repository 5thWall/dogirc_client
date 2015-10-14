defmodule DogircClient.PrivmsgHandler do
  use GenEvent

  alias Dogirc.Command
  import DogircClient.Endpoint, only: [ broadcast!: 3 ]

  def handle_event(%Command{type: type, message: msg, from: usr}, state)
  when type in [:privmsg, :action, :notice] do
    message = %{message: msg, nick: usr.nick, kind: to_string(type)}
    broadcast!("irc:freenode", "message", message)
    {:ok, state}
  end

  def handle_event(%Command{type: :join, from: usr}, state) do
    broadcast!("irc:freenode", "userJoin", usr)
    {:ok, state}
  end

  def handle_event(%Command{type: :part, from: usr}, state) do
    broadcast!("irc:freenode", "userPart", usr)
    {:ok, state}
  end

  def handle_event(cmd, state) do
    {:ok, state}
  end
end
