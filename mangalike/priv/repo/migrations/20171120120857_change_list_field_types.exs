defmodule Mangalike.Repo.Migrations.ChangeListFieldTypes do
  use Ecto.Migration

  def change do

  	drop_if_exists table("lists")
  	
    create table(:lists) do
      add :name, :string
      add :user, :string
      add :serie, :string

      timestamps()
    end
  end

end
