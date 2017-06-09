defmodule AwesomeRanking.ScoreView do
  use AwesomeRanking.Web, :view

  def render("index.json", %{scores: scores}) do
    %{data: render_many(scores, AwesomeRanking.ScoreView, "score.json")}
  end

  def render("show.json", %{score: score}) do
    %{data: render_one(score, AwesomeRanking.ScoreView, "score.json")}
  end

  def render("score.json", %{score: score}) do
    %{id: score.id,
      user_id: score.user_id,
      points: score.points}
  end
end
