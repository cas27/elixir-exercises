defmodule Chp14 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Yo, #{msg}"}
        greet
    end
  end
end


pid = spawn(Chp14, :greet, [])
send pid, {self, "Cory"}

receive do
  {:ok, msg} -> IO.puts msg
end

send pid, {self, "Bob"}

receive do
  {:ok, msg} -> IO.puts msg
end
