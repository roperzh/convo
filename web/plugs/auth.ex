defmodule Convo.Plugs.Auth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    token = get_session(conn, :access_token)
    assign(conn, :token, token)
  end
end
