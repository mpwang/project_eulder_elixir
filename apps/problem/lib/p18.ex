defmodule P18 do
  @size 15

  @triangle [
    [75],
    [95, 64],
    [17, 47, 82],
    [18, 35, 87, 10],
    [20, 4, 82, 47, 65],
    [19, 1, 23, 75, 3, 34],
    [88, 2, 77, 73, 7, 63, 67],
    [99, 65, 4, 28, 6, 16, 70, 92],
    [41, 41, 26, 56, 83, 40, 80, 70, 33],
    [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
    [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
    [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
    [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
    [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
    [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
  ]
  @doc """

  iex> P18.solve
  12
  """
  def solve() do
    cache = process(%{})
    cache = process(cache)
    cache[{0, 0}]
  end

  def process(cache) when map_size(cache) == 0 do
    for i <- 0..@size-1, j <- 0..i do
      {i, j}
    end
    |> Enum.reduce(cache, fn {i, j}, acc ->
      Map.put(acc, {i, j}, @triangle |> Enum.at(i) |> Enum.at(j))
    end)
  end
  def process(cache) do
    for i <- @size-2..0, j <- i..0 do
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

end