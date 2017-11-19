# Attribute to Prof Nathaniel Tuck's class notes and code
defmodule Mangalike.Repo.Migrations.AddPasswords do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :password_hash, :string
  	end
  end
end
