defmodule Fred do
  def name do
    receive do
      {sender, _} ->
        send sender, {:ok, "Fred"}
    end
  end
end

defmodule Betty do
  def name do
    receive do
      {sender, _} ->
        send sender, {:ok, "Betty"}
    end
  end
end

fred = spawn(Fred, :name, [])
betty = spawn(Betty, :name, [])

send betty, {self, "Name?"}
send fred, {self, "Name?"}

receive do
  {:ok, name} -> IO.puts "Your name is #{name}"
end

receive do
  {:ok, name} -> IO.puts "Your name is #{name}"
end
