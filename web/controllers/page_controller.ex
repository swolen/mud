defmodule Swolen.PageController do
  use Swolen.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
