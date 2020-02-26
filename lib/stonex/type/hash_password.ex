defmodule Stonex.Type.HashPassword do
  @behaviour Ecto.Type

  def type, do: :string

  def embed_as(_), do: :self

  def equal?(term1, term2), do: term1 == term2

  @doc """
  Hash password with currenly used hashing algoirth
  """

  def cast(password) when is_binary(password), do: {:ok, Argon2.hash_pwd_salt(password)}
  def cast(_), do: :error

  def load(password) when is_binary(password), do: {:ok, password}
  def load(_), do: :error

  def dump(password) when is_binary(password), do: {:ok, Argon2.hash_pwd_salt(password)}
  def dump(_), do: :error
end
