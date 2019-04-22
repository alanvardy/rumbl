defmodule Rumbl.Accounts.User do
  @moduledoc """
    Users for site
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Rumbl.Accounts.Credential

  schema "users" do
    field :name, :string
    field :username, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc """
  standard changeset for only user attributes
  """
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end

  @doc """
  changeset for user registration, includes credentials
  """
  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast_assoc(:credential, with: &Credential.changeset/2, required: true)
  end
end
