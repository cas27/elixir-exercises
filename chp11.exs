defmodule Chp11 do
  def printable?([h|_]) do
    h in ?\s..?~
  end

  def anagram?(word1, word2) do
    word1 == Enum.reverse(word2)
  end

  def calculate(problem) when is_list(problem) do
    problem
    |> split_on_sign
    |> calculate
  end
  def calculate({x, [?+ | t]}), do: List.to_integer(x) + List.to_integer(t)
  def calculate({x, [?- | t]}), do: List.to_integer(x) - List.to_integer(t)
  def calculate({x, [?* | t]}), do: List.to_integer(x) * List.to_integer(t)
  def calculate({x, [?/ | t]}), do: List.to_integer(x) / List.to_integer(t)

  def split_on_sign(problem) do
    cond do
      Enum.any? problem, &([&1] == '+') -> Enum.split_while problem, &([&1] != '+')
      Enum.any? problem, &([&1] == '-') -> Enum.split_while problem, &([&1] != '-')
      Enum.any? problem, &([&1] == '*') -> Enum.split_while problem, &([&1] != '*')
      Enum.any? problem, &([&1] == '/') -> Enum.split_while problem, &([&1] != '/')
      :else -> raise "Malformed Problem"
    end
  end
end
