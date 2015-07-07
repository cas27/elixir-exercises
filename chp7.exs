defmodule Chp7 do
  def mapsum([], _), do: 0
  def mapsum([head | tail], func) do
    func.(head) + mapsum(tail, func)
  end

  def max([x, y]) do
    cond do
      x > y -> x
      x < y -> y
    end
  end

  def max([head | [head2 | tail]]) when head > head2 do
    max([head | tail])
  end

  def max([head | [head2 | tail]]) when head < head2 do
    max([head2 | tail])
  end

end
