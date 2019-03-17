defmodule Fg.Core.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:title, :slug])
    |> validate_required([:title, :slug])
    |> unique_constraint(:slug)
  end
end
