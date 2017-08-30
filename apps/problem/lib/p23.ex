defmodule P23 do

  @limit 28123

  @doc """
  too slow
  iex> P23.solve()
  4179871
  """
  def solve() do
    fsqrt = @limit |> :math.sqrt |> Float.ceil |> round

    ds = 1..@limit |> Enum.zip(Stream.iterate(1, fn _ -> 1 end)) |> Enum.into(%{})
    ds =
      for i <- 2..fsqrt, j <- i..div(@limit, i) do
        {i, j}
      end
      |> Enum.reduce(ds, &update_divisors_sum/2)

    abundant_numbers = for i <- 2..@limit, ds[i] > i, do: i
    lookup = abundant_numbers |> MapSet.new

    1..@limit
    |> Enum.reject(fn n ->
      abundant_numbers |> Enum.map(fn x -> MapSet.member?(lookup, n - x) end) |> Enum.any?
    end)
    |> Enum.sum
  end

  def update_divisors_sum({i, j}, acc) when i * j > @limit, do: acc
  def update_divisors_sum({i, j}, acc) when i == j, do:  Map.update!(acc, i * j, fn v -> v + i end)
  def update_divisors_sum({i, j}, acc), do: Map.update!(acc, i * j, fn val -> val + i + j end)
end
