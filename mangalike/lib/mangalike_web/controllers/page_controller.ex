defmodule MangalikeWeb.PageController do
  use MangalikeWeb, :controller

  def index(conn, _params) do
    redirect conn, to: user_path(conn, :index)
  end
end
