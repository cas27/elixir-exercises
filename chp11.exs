defmodule Chp11 do
  def printable?([h|_]) do
    h in ?\s..?~
  end
end
