defmodule FourmWeb.DescControllerTest do
  use FourmWeb.ConnCase

  import Fourm.DescsFixtures

  alias Fourm.Descs.Desc

  @create_attrs %{
    title: "some title",
    body: "some body"
  }
  @update_attrs %{
    title: "some updated title",
    body: "some updated body"
  }
  @invalid_attrs %{title: nil, body: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all descs", %{conn: conn} do
      conn = get(conn, ~p"/api/descs")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create desc" do
    test "renders desc when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/descs", desc: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/descs/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some body",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/descs", desc: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update desc" do
    setup [:create_desc]

    test "renders desc when data is valid", %{conn: conn, desc: %Desc{id: id} = desc} do
      conn = put(conn, ~p"/api/descs/#{desc}", desc: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/descs/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some updated body",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, desc: desc} do
      conn = put(conn, ~p"/api/descs/#{desc}", desc: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete desc" do
    setup [:create_desc]

    test "deletes chosen desc", %{conn: conn, desc: desc} do
      conn = delete(conn, ~p"/api/descs/#{desc}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/descs/#{desc}")
      end
    end
  end

  defp create_desc(_) do
    desc = desc_fixture()
    %{desc: desc}
  end
end
