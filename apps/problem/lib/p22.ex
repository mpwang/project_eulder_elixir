defmodule P22 do
  @doc """
  iex> P22.solve()
  1
  """
  def solve() do
    words()
    |> Enum.sort
    |> Enum.with_index(1)
    |> Enum.map(fn {word, position} -> word_to_value(word) * position end)
    |> Enum.sum
  end

  def words() do
    "#{__DIR__}/p022_names.txt"
    |> File.stream!
    |> Enum.take(1)
    |> List.first
    |> String.split(",")
    |> Enum.map(fn word -> String.replace(word, ~s("), "") end)
  end

  @doc """
  iex> P22.word_to_value "COLIN"
  53
  """
  def word_to_value(word) do
    Enum.sum(for <<c <- word>>, do: c - 64)
  end
end