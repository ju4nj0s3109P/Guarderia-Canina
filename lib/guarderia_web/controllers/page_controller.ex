defmodule GuarderiaWeb.PageController do
  use GuarderiaWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
