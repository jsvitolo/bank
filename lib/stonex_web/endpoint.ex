defmodule StonexWeb.Endpoint do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )
  plug(:dispatch)

  get "/health" do
    send_resp(conn, 200, "live!")
  end

  forward("api/v1", to: StonexWeb.Router)

  match _ do
    send_resp(conn, 404, "¯\\_(ツ)_/¯ 404")
  end
end
