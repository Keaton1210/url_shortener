defmodule UrlShortener.Repo do
  use Ecto.Repo,
    otp_app: :url_shortener,
    adapter: Ecto.Adapters.Postgres

  def init(_, config) do
    config = config
      |> Keyword.put(:url, System.get_env("DATABASE_URL"))
    {:ok, config}
  end
end
