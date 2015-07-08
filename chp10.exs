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

  def filter([], _, acc), do: List.flatten(acc)
  def filter([head | tail], func, acc \\ []) do
    cond do
      func.(head) == true -> filter(tail, func, acc ++ [head] )
      :else -> filter(tail, func, [acc])
    end
  end

  def split(list, 0, acc), do: {Enum.reverse(acc), list}
  def split([head | tail], count, acc \\ []) do
    split(tail, count - 1, [head | acc])
  end

  def take(_, 0), do: []
  def take([], _), do: []
  def take([h], 1), do: [h]
  def take([head | tail], count) do
    [head | take(tail, count-1)]
  end

end
