defmodule Chp10 do
  def all?([], _func), do: true
  def all?([head | tail], func \\ fn x -> x end) do
    cond do
      func.(head) -> all?(tail, func)
      :else -> false
    end
  end

  def each([],_), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end
end
