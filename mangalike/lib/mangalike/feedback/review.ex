# Attribute to Prof Nathaniel Tuck's class notes and code
defmodule Mangalike.Feedback.Review do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mangalike.Feedback.Review


  schema "reviews" do
    field :comment, :string
    field :rating, :integer
    belongs_to :serie, Mangalike.Manga.Serie
    belongs_to :user, Mangalike.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Review{} = review, attrs) do
    review
    |> cast(attrs, [:rating, :comment, :user_id, :serie_id])
    |> validate_required([:rating, :comment, :user_id, :serie_id])
  end
end
