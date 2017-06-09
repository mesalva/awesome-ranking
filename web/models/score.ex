defmodule AwesomeRanking.Score do
  use AwesomeRanking.Web, :model

  schema "scores" do
    field :points, :integer
    belongs_to :user, AwesomeRanking.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:points])
    |> cast(params, [:user_id])
    |> validate_required([:points])
    |> validate_required([:user_id])
  end
end
