defmodule Stack.Server do
  use GenServer

  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: :stack)
  end

  def pop do
    GenServer.call(:stack ,:pop)
  end

  def push(el) do
    GenServer.cast(:stack, {:push, el})
  end

  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, el}, current_stack) do
    {:noreply, [el | current_stack]}
  end
end
