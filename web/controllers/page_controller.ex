defmodule AwesomeRanking.PageController do
  use AwesomeRanking.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
