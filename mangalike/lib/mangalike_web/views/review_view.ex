defmodule MangalikeWeb.ReviewView do
  use MangalikeWeb, :view
  alias MangalikeWeb.ReviewView

  def render("index.json", %{reviews: reviews}) do
    %{data: render_many(reviews, ReviewView, "review.json")}
  end

  def render("show.json", %{review: review}) do
    %{data: render_one(review, ReviewView, "review.json")}
  end

  def render("review.json", %{review: review}) do
    %{id: review.id,
      rating: review.rating,
      comment: review.comment,
      user_id: review.user_id,
      serie_id: review.serie_id}
  end
end
