defmodule CLITest do
  use ExUnit.Case

  import Issues.CLI, only: [parse_args: 1, convert_to_list_of_hashdicts: 1, sort_into_ascending_order: 1]

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

  test "sort ascending orders the correct way" do
    result = sort_into_ascending_order(fake_created_at_list(["c", "a", "b"]))
    issues = for issue <- result, do: issue["created_at"]
    assert issues == ~w{a b c}
  end


  defp fake_created_at_list(values) do
    data = for value <- values, do: [{"created_at", value}, {"other_data", "xxx"}]
    convert_to_list_of_hashdicts data
  end

end
