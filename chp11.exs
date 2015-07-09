defmodule Chp11 do
  def printable?([h|_]) do
    h in ?\s..?~
  end

  def anagram?(word1, word2) do
    word1 == Enum.reverse(word2)
  end
end
