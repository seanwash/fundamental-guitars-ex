defmodule Fg.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :title, :string
      add :slug, :string
      add :source, :string
      add :duration, :integer
      add :description, :string
      add :body, :text

      timestamps()
    end

    create unique_index(:exercises, [:slug])
  end
end
