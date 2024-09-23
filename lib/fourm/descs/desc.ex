defmodule Fourm.Descs.Desc do
  use Ecto.Schema
  import Ecto.Changeset

  schema "descs" do
    field :title, :string
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(desc, attrs) do
    desc
    |> cast(attrs, [:body, :title])
    |> validate_required([:body, :title])
  end
end
