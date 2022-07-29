defmodule TaskTesterWeb.PageController do
  use TaskTesterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
