defmodule FourmWeb.PageController do
  use FourmWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def items(conn, _params) do
    items = [
      %{id: 1, name: "item1", desc: "laptop"},
      %{id: 1, name: "item1", desc: "laptop"},
      %{id: 1, name: "item1", desc: "laptop"}
    ]

    json(conn, %{items: items})
  end

  def users(conn, _params) do
    users = [
      %{id: 1, name: "alice", email: "Alice@email.com"},
      %{id: 2, name: "BOB", email: "bob@email.com"}
    ]

    json(conn, %{users: users})
  end
end
