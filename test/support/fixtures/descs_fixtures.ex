defmodule Fourm.DescsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fourm.Descs` context.
  """

  @doc """
  Generate a desc.
  """
  def desc_fixture(attrs \\ %{}) do
    {:ok, desc} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Fourm.Descs.create_desc()

    desc
  end
end
