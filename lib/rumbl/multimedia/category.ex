defmodule Rumbl.Multimedia.Category do
  @moduledoc "Multimedia Category"
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "categories" do
    field :name, :string
    has_many :videos, Rumbl.Multimedia.Video

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  @spec alphabetical(any()) :: Ecto.Query.t()
  def alphabetical(query) do
    from c in query, order_by: c.name
  end
end
