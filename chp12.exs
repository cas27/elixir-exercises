defmodule Chp12 do
  def open(file_path) do
    case File.open(file_path) do
      {:ok, file} -> IO.inspect file
      {:error, message} -> IO.puts :stderr, "Can't open with error: #{message}"
    end
  end

  def case_buzz(num) do
    Enum.map 1..num, &fizz_buzz/1
  end

  defp fizz_buzz(num) do
    case fizz_multiples(num) do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> num
    end
  end

  defp fizz_multiples(num) do
    {rem(num, 3), rem(num, 5)}
  end
end
