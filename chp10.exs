defmodule Chp10 do
  import Chp7

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

  def prime(n) do
    for x <- Chp7.span(2,n), is_prime?(x), do: x
  end

  def is_prime?(num) do
    Enum.all? 2..num-1, &(rem(num,&1) != 0)
  end

  def taxed_orders do
    tax_rates = [NC: 0.075, TX: 0.08]
    orders = [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.80]
    ]

    for [{:id, id}, {:ship_to, state}, {:net_amount, na}] <- orders,
    state == :NC || state == :TX,
    do: [
      id: id, ship_to: state, net_amount: na, total_amount: na * tax_rates[state] + na
    ]
  end

end
