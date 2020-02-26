defmodule Stonex.Auth do
  @moduledoc """
  Authentication system to Stonex
  """

  alias Stonex.{Auth.Account, Repo}

  @doc """
  Creates a account auth for the given attributes

  ## Examples

  iex> register(attrs)
  %Account{}

  iex> register(invalid_attrs)
  ** (Ecto.NoResultsError)
  """
  def register(attrs) do
    Account.build(attrs)
    |> Repo.insert()
  end
end
