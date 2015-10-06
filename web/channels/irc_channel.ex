defmodule DogircClient.IrcChannel do
  use Phoenix.Channel

  def join("irc:freenode", _message, socket) do
    {:ok, socket}
  end

  def join("irc:" <> _network, _params, _socket) do
    {:error, %{reason: "Not Implemented"}}
  end
end
