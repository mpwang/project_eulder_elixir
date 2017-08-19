defmodule P16 do

  @doc """
  iex> P16.solve 15
  26
  iex> P16.solve 1000
  1366
  """
  def solve(limit) do
    :math.pow(2, limit)
    |> round
    |> Integer.digits
    |> Enum.sum
    |> IO.inspect
  end
end
