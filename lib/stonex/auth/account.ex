defmodule Stonex.Auth.Account do
  @moduledoc """
  """
  use Stonex.Schema
  import Ecto.Changeset

  alias Stonex.Type.HashPassword

  schema "auth_accounts" do
    field(:email, :string)
    field(:password, HashPassword)
    field(:password_confirmation, :string, virtual: true)

    timestamps()
  end

  @required_fields ~w(email password password_confirmation)a

  @doc """
  Builds a changeset based on the `struct` and `attrs`
  """
  def build(attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(account, attrs \\ %{}) do
    account
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/.*@.*/)
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
  end
end
