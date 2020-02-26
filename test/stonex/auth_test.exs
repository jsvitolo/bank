defmodule Stonex.AuthTest do
  use Stonex.DataCase

  test "register/1: success" do
    assert {:ok, pedro} =
             Stonex.Auth.register(%{
               email: "pedro@example.com",
               password: "123456",
               password_confirmation: "123456"
             })

    assert pedro.email == "pedro@example.com"
    assert Argon2.verify_pass("123456", pedro.password)
  end

  test "register/1: failure" do
    {:ok, _} =
      Stonex.Auth.register(%{
        email: "pedro@example.com",
        password: "123456",
        password_confirmation: "123456"
      })

    assert {:error, _} =
             Stonex.Auth.register(%{
               email: "pedro@example.com",
               password: "123456",
               password_confirmation: "123456"
             })

   assert {:error, _} = Stonex.Auth.register(%{email: "pedro@example.com", password: "123456"})
  end
end
