# Attribute to Prof Nathaniel Tuck's class notes and code
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
    data = %{
      id: review.id,
      rating: review.rating,
      comment: review.comment,
      serie_id: review.serie_id,
    }

    if Ecto.assoc_loaded?(review.user) do
      Map.put(data, :user_email, review.user.email)
    else
      data
    end        
  end
end
