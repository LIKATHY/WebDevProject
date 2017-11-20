defmodule Mangalike.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :rating, :integer
      add :comment, :text
      add :serie_id, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:reviews, [:user_id])
  end
end
