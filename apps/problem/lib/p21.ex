defmodule P21 do
  @doc """
  iex> P21.solve 10_000
  31626
  """
  def solve(limit) do
    ds =
      1..limit
      |> Enum.zip(Stream.iterate(1, fn _ -> 1 end))
      |> Enum.into(%{})

    fsqrt = :math.sqrt(limit) |> Float.ceil |> round
    ds =
      for i <- 2..fsqrt, j <- i..div(limit, i) do
         {i, j}
      end
      |> Enum.reduce(ds, fn {i, j}, acc ->
        if i * j > limit do
          acc
        else
          Map.update!(
            acc,
            i * j,
            fn val -> if i == j, do: val + i, else: val + i + j end)
        end
      end)

    for i <- 2..limit, ds[i] < i && ds[ds[i]] == i do
      [ds[i], i]
    end
    |> List.flatten
    |> Enum.filter(fn i -> i < limit end)
    |> Enum.sum
  end
end
