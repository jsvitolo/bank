defmodule StonexWeb.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  match _ do
    send_resp(conn, 404, "¯\\_(ツ)_/¯ 404")
  end
end
