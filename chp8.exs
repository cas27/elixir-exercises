defmodule Chp8 do
  defstruct page: 0, title: "Dictionaries, Maps, etc"

  def last_page?(%Chp8{page: page}), do: page == 86
end
