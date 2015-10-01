defmodule DogircClient.PageController do
  use DogircClient.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
