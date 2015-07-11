defmodule Issues.TableData do
  def table(data) do
    IO.write header
    data
    |> extract_wanted_data
    |> print_data
  end

  defp extract_wanted_data([]), do: []
  defp extract_wanted_data([h|t]) do
    [{Dict.get(h, "number"), Dict.get(h, "created_at"), Dict.get(h, "title")} | extract_wanted_data(t) ]
  end

  defp header do
    """

     #   | created_at                  | title
    -----+-----------------------------+-------------------------------------
    """
  end

  defp print_data([]), do: IO.puts ""
  defp print_data([{number, created_at, title}|t]) do
    IO.puts "#{number} | #{created_at}        | #{title}"
    print_data(t)
  end

end
