defmodule P15 do
  @moduledoc """
  Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
  there are exactly 6 routes to the bottom right corner.

  How many such routes are there through a 20×20 grid?
  """

  @doc """
  iex> P15.solve 1
  2
  iex> P15.solve 2
  6
  iex> P15.solve 20
  137846528820
  """
  def solve(size) do
    cache = process(size, size, %{})
    cache[{0, 0}]
  end

  @doc """
  http://www.mathblog.dk/project-euler-15/

  Dynamic programming
  """
  def process(size, size, cache) when map_size(cache) == 0 do
    cache =
      0..size - 1
      |> Enum.reduce(%{}, fn i, acc ->
        acc = Map.put(acc, {i, size}, 1)
        acc = Map.put(acc, {size, i}, 1)
      end)
    process(size, size, cache)
  end
  def process(size, size, cache) do
    for i <- size-1..0, j <- size-1..0 do
      {i, j}
    end
    |> Enum.reduce(cache, fn {i, j}, acc ->
      Map.put(acc, {i, j}, acc[{i + 1, j}] + acc[{i, j + 1}])
    end)
  end
end