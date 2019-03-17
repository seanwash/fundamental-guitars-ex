defmodule Fg.Core.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :body, :string
    field :description, :string
    field :duration, :integer
    field :slug, :string
    field :source, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:title, :slug, :source, :duration, :description, :body])
    |> validate_required([:title, :slug, :source, :duration, :description, :body])
    |> unique_constraint(:slug)
  end
end
