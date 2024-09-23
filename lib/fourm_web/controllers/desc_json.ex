defmodule FourmWeb.DescJSON do
  alias Fourm.Descs.Desc

  @doc """
  Renders a list of descs.
  """
  def index(%{descs: descs}) do
    %{data: for(desc <- descs, do: data(desc))}
  end

  @doc """
  Renders a single desc.
  """
  def show(%{desc: desc}) do
    %{data: data(desc)}
  end

  defp data(%Desc{} = desc) do
    %{
      id: desc.id,
      body: desc.body,
      title: desc.title
    }
  end
end
