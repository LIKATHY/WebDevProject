defmodule MangalikeWeb.ChatController do
  use MangalikeWeb, :controller

  alias Mangalike.Manga
  alias Mangalike.Manga.Chat

  #def index(conn, _params) do
  #  chats = Manga.list_chats()
  #  render(conn, "index.html", chats: chats)
  #end

  def index(conn, _params) do
    chats = Enum.sort(Mangalike.get_titles())
    render(conn, "index.html", chats: chats)
  end

  def new(conn, _params) do
    changeset = Manga.change_chat(%Chat{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chat" => chat_params}) do
    case Manga.create_chat(chat_params) do
      {:ok, chat} ->
        conn
        |> put_flash(:info, "Chat created successfully.")
        |> redirect(to: chat_path(conn, :show, chat))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manga = Mangalike.get_manga_info(Mangalike.get_id_by_title(id))
    render(conn, "show.html", manga: manga)
  end

  #def show(conn, %{"id" => id}) do
  #  chat = Manga.get_chat!(id)
  #  render(conn, "show.html", chat: chat)
  #end

  def edit(conn, %{"id" => id}) do
    chat = Manga.get_chat!(id)
    changeset = Manga.change_chat(chat)
    render(conn, "edit.html", chat: chat, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chat" => chat_params}) do
    chat = Manga.get_chat!(id)

    case Manga.update_chat(chat, chat_params) do
      {:ok, chat} ->
        conn
        |> put_flash(:info, "Chat updated successfully.")
        |> redirect(to: chat_path(conn, :show, chat))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chat: chat, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat = Manga.get_chat!(id)
    {:ok, _chat} = Manga.delete_chat(chat)

    conn
    |> put_flash(:info, "Chat deleted successfully.")
    |> redirect(to: chat_path(conn, :index))
  end
end
