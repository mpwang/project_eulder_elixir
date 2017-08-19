defmodule P29 do

  @doc """
  iex> P29.solve 100
  9183
  """
  def solve(limit) do
    for a <- 2..limit, b <- 2..limit do
      {a, b}
    end
    |> Enum.map(fn {a, b} -> :math.pow(a, b) end)
    |> MapSet.new
    |> Enum.to_list
    |> Enum.sort
    |> length
  end
end
