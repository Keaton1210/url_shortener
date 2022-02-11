defmodule UrlShortenerWeb.UrlController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url

  def index(conn, _params) do
    urls = Urls.list_urls()
    render(conn, "index.html", urls: urls)
  end

  def new(conn, _params) do
    changeset = Urls.change_url(%Url{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"url" => url_params}) do
    case Urls.create_url(url_params) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Url created successfully.")
        |> redirect(to: Routes.url_path(conn, :show, url))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Urls.get_url!(id)
    render(conn, "show.html", url: url)
  end

  def edit(conn, %{"id" => id}) do
    url = Urls.get_url!(id)
    changeset = Urls.change_url(url)
    render(conn, "edit.html", url: url, changeset: changeset)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = Urls.get_url!(id)

    case Urls.update_url(url, url_params) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Url updated successfully.")
        |> redirect(to: Routes.url_path(conn, :show, url))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", url: url, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = Urls.get_url!(id)
    {:ok, _url} = Urls.delete_url(url)

    conn
    |> put_flash(:info, "Url deleted successfully.")
    |> redirect(to: Routes.url_path(conn, :index))
  end
end
