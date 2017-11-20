defmodule Mangalike.Feedback.Review do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mangalike.Feedback.Review


  schema "reviews" do
    field :comment, :string
    field :rating, :integer
    field :serie_id, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Review{} = review, attrs) do
    review
    |> cast(attrs, [:rating, :comment, :serie_id])
    |> validate_required([:rating, :comment, :serie_id])
  end
end
