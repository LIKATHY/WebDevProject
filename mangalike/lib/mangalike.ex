defmodule Mangalike do
  @moduledoc """
  Mangalike keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def manga_list() do
    resp = HTTPoison.get!("http://www.mangaeden.com/api/list/0/")
    data = Poison.decode!(resp.body)
    data["manga"]
  end

  def get_titles() do
    xs = manga_list()
    Enum.map xs, fn x ->
      x["t"]
    end
  end

  def map_titles() do 
    xs = manga_list()
    Enum.map xs, fn x ->
      %{title: x["t"], id: x["i"]}
    end
  end

  def get_id_by_title(title) do
    filter = Enum.filter(map_titles(), fn(x) -> x[:title] == title end)
    info = Enum.map(filter, fn(x) -> x[:id] end)
    Enum.fetch!(info, 0)
  end

  def get_manga_info(id) do
    resp = HTTPoison.get!("http://www.mangaeden.com/api/manga/#{id}/")
    data = Poison.decode!(resp.body)
  end

  def random_manga() do
    xs = manga_list()
    random = Enum.random(xs)["t"]
  end

end

