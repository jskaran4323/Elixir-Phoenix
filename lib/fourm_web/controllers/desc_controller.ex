defmodule FourmWeb.DescController do
  use FourmWeb, :controller

  alias Fourm.Descs
  alias Fourm.Descs.Desc

  action_fallback(FourmWeb.FallbackController)

  def index(conn, _params) do
    descs = Descs.list_descs()
    render(conn, :index, descs: descs)
  end

  def create(conn, %{"desc" => desc_params}) do
    results = Descs.create_desc(desc_params)
    IO.inspect(results)

    with {:ok, %Desc{} = desc} <- results do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/descs/#{desc}")
      |> render(:show, desc: desc)
    end
  end

  def show(conn, %{"id" => id}) do
    desc = Descs.get_desc!(id)
    render(conn, :show, desc: desc)
  end

  def update(conn, %{"id" => id, "desc" => desc_params}) do
    desc = Descs.get_desc!(id)

    with {:ok, %Desc{} = desc} <- Descs.update_desc(desc, desc_params) do
      render(conn, :show, desc: desc)
    end
  end

  def delete(conn, %{"id" => id}) do
    desc = Descs.get_desc!(id)

    with {:ok, %Desc{}} <- Descs.delete_desc(desc) do
      send_resp(conn, :no_content, "")
    end
  end
end
