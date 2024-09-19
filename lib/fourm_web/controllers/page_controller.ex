defmodule FourmWeb.PageController do
  use FourmWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    users = [
      %{id: 1, name: "alice", email: "Alice@email.com"},
      %{id: 2, name: "BOB", email: "bob@eail.com"}
    ]

    render(conn, :users, users: users, layout: false)
  end
end
