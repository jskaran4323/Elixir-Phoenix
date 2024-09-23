defmodule Fourm.Descs do
  @moduledoc """
  The Descs context.
  """

  import Ecto.Query, warn: false
  alias Fourm.Repo

  alias Fourm.Descs.Desc

  @doc """
  Returns the list of descs.

  ## Examples

      iex> list_descs()
      [%Desc{}, ...]

  """
  def list_descs do
    Repo.all(Desc)
  end

  @doc """
  Gets a single desc.

  Raises `Ecto.NoResultsError` if the Desc does not exist.

  ## Examples

      iex> get_desc!(123)
      %Desc{}

      iex> get_desc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_desc!(id), do: Repo.get!(Desc, id)

  @doc """
  Creates a desc.

  ## Examples

      iex> create_desc(%{field: value})
      {:ok, %Desc{}}

      iex> create_desc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_desc(attrs \\ %{}) do
    %Desc{}
    |> Desc.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a desc.

  ## Examples

      iex> update_desc(desc, %{field: new_value})
      {:ok, %Desc{}}

      iex> update_desc(desc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_desc(%Desc{} = desc, attrs) do
    desc
    |> Desc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a desc.

  ## Examples

      iex> delete_desc(desc)
      {:ok, %Desc{}}

      iex> delete_desc(desc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_desc(%Desc{} = desc) do
    Repo.delete(desc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking desc changes.

  ## Examples

      iex> change_desc(desc)
      %Ecto.Changeset{data: %Desc{}}

  """
  def change_desc(%Desc{} = desc, attrs \\ %{}) do
    Desc.changeset(desc, attrs)
  end
end
