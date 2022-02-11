defmodule UrlShortenerWeb.RedirectController do
  use UrlShortenerWeb, :controller

  import Ecto.Query

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url
  alias UrlShortener.Repo

  def redirecttolink(conn, %{"id" => id}) do

    originallink = Repo.get(Url, id)
    urlz = originallink.url
    #urlz = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    redirect(conn, external: urlz)
  end
end
