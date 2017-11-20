defmodule Mangalike.Manga.Serie do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mangalike.Manga.Serie

  schema "series" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Serie{} = serie, attrs) do
    serie
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
