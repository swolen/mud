defmodule Swolen.UserNameAssigner do
  # import Plug.Conn, only: [:assign]
  def init(opts) do
    opts
  end

  def call(conn, opts) do
    username = conn.params["username"] || Faker.Name.name
    conn = Plug.Conn.assign(conn, :username, username)
  end

end
