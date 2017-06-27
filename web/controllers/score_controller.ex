defmodule AwesomeRanking.ScoreController do
  use AwesomeRanking.Web, :controller

  alias AwesomeRanking.Score

  def index(conn, _params) do
    scores = Repo.all(Score)
    render(conn, "index.json", scores: scores)
  end

  def create(conn, %{"score" => score_params}) do
    changeset = Score.changeset(%Score{}, score_params)

    case Repo.insert(changeset) do
      {:ok, score} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", score_path(conn, :show, score))
        |> render("show.json", score: score)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(AwesomeRanking.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    score = Repo.get!(Score, id)
    render(conn, "show.json", score: score)
  end
end
