defmodule P30 do

  @doc """
  iex> P30.solve 4
  19316
  iex> P30.solve 5
  443839
  """
  def solve(limit) do
    2..(:math.pow(10, limit + 1) - 1 |> round)
    |> Enum.filter(fn n ->
      n 
      |> Integer.digits 
      |> Enum.map(fn digit -> round(:math.pow(digit, limit)) end)
      |> Enum.sum
      |> Kernel.==(n)
    end)
    |> Enum.sum
  end
end
