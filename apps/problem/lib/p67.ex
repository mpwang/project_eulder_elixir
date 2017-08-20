defmodule P67 do
  @doc """

  iex> P67.solve()
  7273
  """
  def solve() do
    cache = process(size, %{})
    cache = process(size, cache)
    cache[{0, 0}]
  end

  def process(size, cache) when map_size(cache) == 0 do
    triangle = get_triangle()

    for i <- 0..size-1, j <- 0..i do
      {i, j}
    end
    |> Enum.reduce(cache, fn {i, j}, acc ->
      Map.put(acc, {i, j}, triangle |> Enum.at(i) |> Enum.at(j))
    end)
  end
  def process(size, cache) do
    for i <- size-2..0, j <- i..0 do
      {i, j}
    end
    |> Enum.reduce(cache, fn {i, j}, acc ->
      Map.put(acc, {i, j}, update_rule(i, j, acc))
    end)
  end

  def update_rule(i, j, cache) do
    max(
      cache[{i, j}] + cache[{i + 1, j}],
      cache[{i, j}] + cache[{i + 1, j + 1}]
    )
  end

  @doc """
  iex> P67.size
  100
  """
  def size() do
    get_triangle() |> List.last |> length
  end

  def get_triangle() do
    File.stream!("#{__DIR__}/p067_triangle.txt")
    |> Stream.map(fn line ->
      line
      |> String.trim
      |> String.split(" ")
      |> Enum.map(&String.to_integer(&1))
    end)
    |> Enum.to_list
  end

end