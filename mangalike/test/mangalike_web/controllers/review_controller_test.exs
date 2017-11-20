defmodule MangalikeWeb.ReviewControllerTest do
  use MangalikeWeb.ConnCase

  alias Mangalike.Feedback
  alias Mangalike.Feedback.Review

  @create_attrs %{comment: "some comment", rating: 42}
  @update_attrs %{comment: "some updated comment", rating: 43}
  @invalid_attrs %{comment: nil, rating: nil}

  def fixture(:review) do
    {:ok, review} = Feedback.create_review(@create_attrs)
    review
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all reviews", %{conn: conn} do
      conn = get conn, review_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create review" do
    test "renders review when data is valid", %{conn: conn} do
      conn = post conn, review_path(conn, :create), review: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, review_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "comment" => "some comment",
        "rating" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, review_path(conn, :create), review: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update review" do
    setup [:create_review]

    test "renders review when data is valid", %{conn: conn, review: %Review{id: id} = review} do
      conn = put conn, review_path(conn, :update, review), review: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, review_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "comment" => "some updated comment",
        "rating" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, review: review} do
      conn = put conn, review_path(conn, :update, review), review: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete review" do
    setup [:create_review]

    test "deletes chosen review", %{conn: conn, review: review} do
      conn = delete conn, review_path(conn, :delete, review)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, review_path(conn, :show, review)
      end
    end
  end

  defp create_review(_) do
    review = fixture(:review)
    {:ok, review: review}
  end
end
