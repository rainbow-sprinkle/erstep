defmodule KV.StackTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = GenServer.start_link(KV.Stack, [])
    {:ok, pid: pid}
  end

  test "pushes element to stack with GenServer.cast", %{pid: pid} do
    GenServer.cast(pid, {:push, "elixir"})
    Process.sleep(100) # Introduce a delay to allow the cast operation to complete
    stack = GenServer.call(pid, :pop)
    assert stack == "elixir!"
    IO.inspect GenServer.cast(pid, {:push, "elixir"})
  end
end
