defmodule SocketTest do
  use ExUnit.Case, async: false

  @protocols ["tcp", "ssl", "ws", "wss", "udp"]

  setup_all do
    Socket.listen "tcp://127.0.0.1:54321"
    Socket.listen "ssl://127.0.0.1:54322"
    Socket.listen "ws://127.0.0.1:54323/ws"
    Socket.listen "wss://127.0.0.1:54324/wss"
    # Socket.listen "udp://127.0.0.1:54325"
    :ok
  end

  test "connect to valid ip using tcp", do: assert {:ok, _} = Socket.connect("tcp://127.0.0.1:54321")
#  test "connect to valid ip using ssl", do: assert {:ok, _} = Socket.connect("ssl://127.0.0.1:54322")
#  test "connect to valid ip using ws",  do: assert {:ok, _} = Socket.connect("ws://127.0.0.1:54323/ws")
#  test "connect to valid ip using wss", do: assert {:ok, _} = Socket.connect("wss://127.0.0.1:54324/wss")
end