defmodule DogircClient.PrivmsgHandler do
  use GenEvent

  alias Dogirc.Command

  def handle_event(%Command{type: :privmsg, message: msg, from: usr}, state) do
    message = %{message: msg, nick: usr.nick, kind: "privmsg"}
    DogircClient.Endpoint.broadcast!("irc:freenode", "message", message)
    {:ok, state}
  end

  def handle_event(%Command{type: :action, message: msg, from: usr}, state) do
    message = %{message: msg, nick: usr.nick, kind: "action"}
    DogircClient.Endpoint.broadcast!("irc:freenode", "message", message)
    {:ok, state}
  end

  def handle_event(cmd, state) do
    {:ok, state}
  end
end
