defmodule DogircClient.PrivmsgHandler do
  use GenEvent

  alias DogIRC.Command

  def handle_event(%Command{type: :privmsg, message: msg, from: usr}, state) do
    message = %{message: msg, nick: usr.nick}
    DogircClient.Endpoint.broadcast!("irc:freenode", "privmsg", message)
    {:ok, state}
  end

  def handle_event(%Command{type: :action, message: msg, from: usr}, state) do
    message = %{message: msg, nick: usr.nick}
    DogircClient.Endpoint.broadcast!("irc:freenode", "action", message)
    {:ok, state}
  end

  def handle_event(cmd, state) do
    {:ok, state}
  end
end
