defmodule UrlShortener.Urls.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> validate_format(:url, ~r/https:/)
  end
end
