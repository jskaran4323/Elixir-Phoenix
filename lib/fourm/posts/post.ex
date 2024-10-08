defmodule Fourm.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field(:title, :string)
    field(:body, :string)
    belongs_to(:user, Fourm.Accounts.User)
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :title])
    |> validate_required([:body, :title])
  end
end
