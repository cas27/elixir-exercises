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

  def center(word_list) do
    word_list
    |> longest_word_length
    |> words_with_spacing(word_list)
    |> Enum.each &(IO.puts/1)
  end

  defp longest_word_length(word_list) do
    Enum.max_by(word_list, &(String.length/1)) |> String.length
  end

  defp words_with_spacing(spacing, word_list) do
    Enum.map word_list, &(String.rjust(&1, spacing - String.length(&1)))
  end
end
