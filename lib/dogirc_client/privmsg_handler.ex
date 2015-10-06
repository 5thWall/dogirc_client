defmodule DogircClient.PrivmsgHandler do
  use GenEvent

  alias DogIRC.Command

  def handle_event(cmd = %Command{type: :privmsg, message: msg}, state) do
    DogircClient.Endpoint.broadcast!("irc:freenode", "privmsg", %{msg: msg})
    {:ok, state}
  end

  def handle_event(cmd, state) do
    {:ok, state}
  end
end
