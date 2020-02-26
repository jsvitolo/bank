defmodule Stonex.Repo.Migrations.CreateAuthAccountsTable do
  use Ecto.Migration

  def up do
    execute(~s(CREATE EXTENSION IF NOT EXISTS "citext"))

    create table(:auth_accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :text
      add :password, :string

      timestamps()
    end

    create unique_index(:auth_accounts, [:email])
  end

  def down do
    execute(~s(DROP EXTENSION IF EXISTS "citext"))

    drop table(:auth_accounts)
  end
end
