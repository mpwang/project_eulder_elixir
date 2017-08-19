defmodule P25 do

  @doc """
  iex> P25.solve 3
  12
  iex> P25.solve 1000
  4782
  """
  def solve(limit) do
    Stream.iterate([0, 1], fn [a, b] -> [b, a + b] end)
    |> Stream.take_while(fn [a, _] -> length(Integer.digits(a)) < limit end)
    |> Stream.map(fn [_, b] -> b end)
    |> Enum.to_list
    |> length
  end
end
