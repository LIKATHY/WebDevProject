defmodule MangalikeWeb.PageController do
  use MangalikeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
