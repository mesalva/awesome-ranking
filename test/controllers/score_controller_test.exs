defmodule AwesomeRanking.ScoreControllerTest do
  use AwesomeRanking.ConnCase

  alias AwesomeRanking.User
  alias AwesomeRanking.Score
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, score_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates resource when data is valid", %{conn: conn} do
    {:ok, user} = Repo.insert %User{email: "some content", name: "bola"}
    conn = post conn, score_path(conn, :create), score: %{user_id: user.id, points: 42}
    assert json_response(conn, 201)["data"]["id"]
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, score_path(conn, :create), score: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
