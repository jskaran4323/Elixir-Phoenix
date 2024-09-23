defmodule Fourm.Repo.Migrations.CreateDescs do
  use Ecto.Migration

  def change do
    create table(:descs) do
      add :body, :string
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
