defmodule CLITest do
  use ExUnit.Case

  import Issues.CLI, only: [parse_args: 1]

  test ":help returned with -h or --help flags" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three args returned if given" do
    assert parse_args(["cas27", "elixir", "99"]) == {"cas27", "elixir", 99}
  end

  test "is only 2 args given then default count returned" do
    assert parse_args(["cas27", "elixir"]) == {"cas27", "elixir", 4}
  end

end
