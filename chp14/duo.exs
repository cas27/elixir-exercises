defmodule Fred do
  def name do
    receive do
      {sender, _} ->
        send sender, "Fred"
    end
  end
end

defmodule Betty do
  def name do
    receive do
      {sender, _} ->
        send sender, "Betty"
    end
  end
end

fred = spawn(Fred, :name, [])
betty = spawn(Betty, :name, [])

send betty, {self, "Name?"}
send fred, {self, "Name?"}

receive do
  name when name == "Betty" ->
    IO.puts "Your name is Betty"
    receive do
        name -> IO.puts "Your name is #{name}"
    end
end
