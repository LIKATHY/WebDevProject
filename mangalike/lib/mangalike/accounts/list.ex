defmodule Mangalike.Accounts.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mangalike.Accounts.List


  schema "lists" do
    field :name, :string
    field :user, :string
    field :serie, :string

    timestamps()
  end

  @doc false
  def changeset(%List{} = list, attrs) do
    list
    |> cast(attrs, [:name, :user, :serie])
    |> validate_required([:name, :user, :serie])
  end
end
