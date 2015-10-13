defmodule DogircClient.PrivmsgHandler do
  use GenEvent

  alias Dogirc.Command

  def handle_event(%Command{type: type, message: msg, from: usr}, state)
  when type in [:privmsg, :action, :notice] do
    message = %{message: msg, nick: usr.nick, kind: to_string(type)}
    DogircClient.Endpoint.broadcast!("irc:freenode", "message", message)
    {:ok, state}
  end

  def handle_event(cmd, state) do
    {:ok, state}
  end
end
