defmodule Mangalike.Manga.Chat do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mangalike.Manga.Chat


  schema "chats" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Chat{} = chat, attrs) do
    chat
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
