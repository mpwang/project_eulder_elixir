defmodule P6 do
  @doc """
  iex> P6.solve 10
  2640.0
  iex> P6.solve 100
  25164150.0
  """
  def solve(limit) do
    sum_of_squares =
      1..limit |> Enum.map(fn x -> :math.pow(x, 2) end) |> Enum.sum

    square_of_sum =
      1..limit |> Enum.sum |> :math.pow(2)

    abs(sum_of_squares - square_of_sum)
  end
end
