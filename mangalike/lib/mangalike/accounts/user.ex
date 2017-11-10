defmodule Mangalike.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mangalike.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email])
    |> validate_required([:name, :username, :email])
  end
end
