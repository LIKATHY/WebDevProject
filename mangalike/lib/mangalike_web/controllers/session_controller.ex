defmodule MangalikeWeb.SessionController do
  use MangalikeWeb, :controller

  alias Mangalike.Accounts

  def login(conn, %{"email" => email}) do
    user = Accounts.get_user_by_email(email)

    if user do

      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.email}")
      |> redirect(to: user_path(conn, :index))
    else
      conn
      |> put_session(:user_id, nil)
      |> put_flash(:error, "No such user")
      |> redirect(to: user_path(conn, :new))
    end
  end

  def logout(conn, _args) do
    conn
    |> put_session(:user_id, nil)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: user_path(conn, :new))
  end
end