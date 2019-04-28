defmodule Rumble.AccountsTest do
  use Rumbl.DataCase

  alias Rumbl.Accounts
  alias Rumbl.Accounts.User

  describe "register_user/0" do
    @valid_attrs %{
      name: "User",
      username: "eva",
      credential: %{email: "eva@test.com", password: "secret"}
    }
    @invalid_attrs %{}

    test "with valid data inserts user" do
      assert {:ok, %User{id: id} = user} = Accounts.register_user(@valid_attrs)
      assert user.name == "User"
      assert user.username == "eva"
      assert user.credential.email == "eva@test.com"
      assert [%User{id: ^id}] = Accounts.list_users()
    end
  end
end
