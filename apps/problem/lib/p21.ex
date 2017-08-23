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

    fsqrt = :math.sqrt(limit) |> Float.floor |> round
    ds =
      for i <- 2..fsqrt, j <- i+1..div(limit, i) do
         {i, j}
      end
      |> Enum.reduce(ds, fn {i, j}, acc ->
        Map.update(acc, i * j, 1, fn val ->
          val + i + j
        end)
      end)

    for i <- 2..limit, ds[i] < i && ds[ds[i]] == i do
      [ds[i], i] |> IO.inspect
    end
    |> List.flatten
    |> Enum.filter(fn i -> i < limit end)
    |> Enum.sum
  end
end

defmodule P21.Slow do
  @doc """
  not working, too slow
  """
  def solve(limit) do
    for a <- 1..limit, b <- 1..limit, a < b do
      {a, b}
    end
    |> Stream.filter(fn {a, b} -> is_amicable_numbers(a, b) end)
    |> Stream.flat_map(fn {a, b} -> [a, b] end)
    |> Enum.to_list
  end

  @doc """
  iex> P21.is_amicable_numbers 220, 284
  true
  """
  def is_amicable_numbers(a, b) do
    a != b && d(a) == b && d(b) == a
  end

  def d(num) do
    fsqrt = :math.sqrt(num) |> Float.floor |> round

    1..fsqrt
    |> Stream.filter(fn x -> rem(num, x) == 0 end)
    |> Stream.flat_map(fn x -> [div(num, x), x] end)
    |> Stream.dedup
    |> Stream.filter(fn x -> x < num end)
    |> Enum.sum
  end
end
