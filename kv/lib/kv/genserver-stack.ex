defmodule KV.Stack do
  use GenServer

  def init(initial_state) do
    {:ok, initial_state}
  end

  def handle_cast({:push, element}, stack) do
    new_stack = [element | stack]
    {:noreply, new_stack}
  end

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_call(:pop, _from, []), do: {:reply, nil, []}

  def handle_call(:get_stack, _from, stack), do: {:reply, stack}
end
