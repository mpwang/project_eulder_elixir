defmodule P14 do

  @doc """
  iex>P14.solve 1_000_000
  837799
  """
  def solve(limit) do
    collatz_sequence_length = fn n ->
      Stream.iterate(n, &next_collatz/1)
      |> Enum.take_while(fn x -> x >= 2 end)
      |> length
      |> Kernel.+(1)
    end

    {starting_number, _} =
      2..limit
      |> Stream.map(fn n -> {n, collatz_sequence_length.(n)} end)
      |> Enum.max_by(fn {_, len} -> len end)

    starting_number
  end

  def next_collatz(n) do
    cond do
      1 == n -> 1
      rem(n, 2) == 0 -> round(n / 2)
      rem(n, 2) == 1 -> 3 * n + 1
    end
  end
end
