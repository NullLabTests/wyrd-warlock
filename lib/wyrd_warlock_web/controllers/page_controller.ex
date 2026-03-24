defmodule WyrdWarlockWeb.PageController do
  use WyrdWarlockWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
