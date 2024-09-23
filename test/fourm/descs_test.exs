defmodule Fourm.DescsTest do
  use Fourm.DataCase

  alias Fourm.Descs

  describe "descs" do
    alias Fourm.Descs.Desc

    import Fourm.DescsFixtures

    @invalid_attrs %{title: nil, body: nil}

    test "list_descs/0 returns all descs" do
      desc = desc_fixture()
      assert Descs.list_descs() == [desc]
    end

    test "get_desc!/1 returns the desc with given id" do
      desc = desc_fixture()
      assert Descs.get_desc!(desc.id) == desc
    end

    test "create_desc/1 with valid data creates a desc" do
      valid_attrs = %{title: "some title", body: "some body"}

      assert {:ok, %Desc{} = desc} = Descs.create_desc(valid_attrs)
      assert desc.title == "some title"
      assert desc.body == "some body"
    end

    test "create_desc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Descs.create_desc(@invalid_attrs)
    end

    test "update_desc/2 with valid data updates the desc" do
      desc = desc_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body"}

      assert {:ok, %Desc{} = desc} = Descs.update_desc(desc, update_attrs)
      assert desc.title == "some updated title"
      assert desc.body == "some updated body"
    end

    test "update_desc/2 with invalid data returns error changeset" do
      desc = desc_fixture()
      assert {:error, %Ecto.Changeset{}} = Descs.update_desc(desc, @invalid_attrs)
      assert desc == Descs.get_desc!(desc.id)
    end

    test "delete_desc/1 deletes the desc" do
      desc = desc_fixture()
      assert {:ok, %Desc{}} = Descs.delete_desc(desc)
      assert_raise Ecto.NoResultsError, fn -> Descs.get_desc!(desc.id) end
    end

    test "change_desc/1 returns a desc changeset" do
      desc = desc_fixture()
      assert %Ecto.Changeset{} = Descs.change_desc(desc)
    end
  end
end
