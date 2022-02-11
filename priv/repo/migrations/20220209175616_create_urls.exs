defmodule UrlShortener.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :url, :string

      timestamps()
    end
  end
end
