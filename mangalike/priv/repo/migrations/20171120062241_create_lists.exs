defmodule Mangalike.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do

    create table(:lists) do
      add :name, :string
      add :user, :string
      add :serie, :string

      timestamps()
    end
  end
end
