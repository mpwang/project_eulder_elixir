defmodule P23 do

  @limit 28123

  @doc """
  too slow
  iex> P23.solve()
  4179871
  """
  def solve() do
    ds =
      1..@limit
      |> Enum.zip(Stream.iterate(1, fn _ -> 1 end))
      |> Enum.into(%{})

    fsqrt = @limit |> :math.sqrt |> Float.ceil |> round
    ds =
      for i <- 2..fsqrt, j <- i..div(@limit, i) do
        {i, j}
      end
      |> Enum.reduce(ds, fn {i, j}, acc ->
        if i * j > @limit do
          acc
        else
          Map.update!(
            acc,
            i * j,
            fn val -> if i == j, do: val + i, else: val + i + j end)
        end
      end)

    abundant_numbers = for i <- 2..@limit, ds[i] > i, do: i
    lookup = abundant_numbers |> MapSet.new

    1..@limit
    |> Enum.reject(fn n ->
      abundant_numbers
      |> Enum.map(fn x -> MapSet.member?(lookup, n - x) end)
      |> Enum.any?
    end)
    |> Enum.sum
  end
end
