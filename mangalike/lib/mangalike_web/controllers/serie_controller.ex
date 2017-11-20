defmodule MangalikeWeb.SerieController do
  use MangalikeWeb, :controller

  alias Mangalike.Manga
  alias Mangalike.Manga.Serie

  def index(conn, _params) do
    series = Enum.sort(Mangalike.get_titles())
    random = Mangalike.random_manga()
    render(conn, "index.html", series: series,  random: random)
  end

  def new(conn, _params) do
    changeset = Manga.change_serie(%Serie{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"serie" => serie_params}) do
    case Manga.create_serie(serie_params) do
      {:ok, serie} ->
        conn
        |> put_flash(:info, "Serie created successfully.")
        |> redirect(to: serie_path(conn, :show, serie))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manga = Mangalike.get_manga_info(Mangalike.get_id_by_title(id))
    chat = %Mangalike.Manga.Chat{id: manga["title"]}
    render(conn, "show.html", manga: manga, chat: chat)
  end

  def edit(conn, %{"id" => id}) do
    serie = Manga.get_serie!(id)
    changeset = Manga.change_serie(serie)
    render(conn, "edit.html", serie: serie, changeset: changeset)
  end

  def update(conn, %{"id" => id, "serie" => serie_params}) do
    serie = Manga.get_serie!(id)

    case Manga.update_serie(serie, serie_params) do
      {:ok, serie} ->
        conn
        |> put_flash(:info, "Serie updated successfully.")
        |> redirect(to: serie_path(conn, :show, serie))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", serie: serie, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    serie = Manga.get_serie!(id)
    {:ok, _serie} = Manga.delete_serie(serie)

    conn
    |> put_flash(:info, "Serie deleted successfully.")
    |> redirect(to: serie_path(conn, :index))
  end
end
