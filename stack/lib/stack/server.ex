defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, el}, current_stack) do
    {:noreply, [el | current_stack]}
  end
end
