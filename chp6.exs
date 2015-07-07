defmodule Chp6 do
  def sum(1), do: 1
  def sum(n), do: sum(n-1) + n

  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y, rem(x,y))

  def guess(actual, range = low..high) do
    guess = div(low+high, 2)
    IO.puts "Is it #{guess}?"
    guess(actual, guess, range)
  end

  defp guess(actual, actual, _ ), do: IO.puts actual
  defp guess(actual, guess, low.._high)
    when guess > actual,
    do: guess(actual, low..guess - 1)
  defp guess(actual, guess, _low..high) when guess < actual do
    guess(actual, guess+1..high)
  end
end
