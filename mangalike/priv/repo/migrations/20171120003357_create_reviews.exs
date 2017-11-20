defmodule Mangalike.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :rating, :integer, null: false
      add :comment, :text, null: false
      add :serie_id, references(:series, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:reviews, [:serie_id])
    create index(:reviews, [:user_id])
  end
end
