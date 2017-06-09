defmodule AwesomeRanking.Repo.Migrations.CreateScore do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :points, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:scores, [:user_id])

  end
end
