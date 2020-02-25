defmodule StonexWeb.EndpointTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts StonexWeb.Endpoint.init([])

  test "it returns live" do
    # Create a test connection
    conn = conn(:get, "/health")

    # Invoke the plug
    conn = StonexWeb.Endpoint.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "live!"
  end

  test "it returns 404 when no route matches" do
    # Create a test connection
    conn = conn(:get, "/fail")

    # Invoke the plug
    conn = StonexWeb.Endpoint.call(conn, @opts)

    # Assert the response
    assert conn.status == 404
  end
end
