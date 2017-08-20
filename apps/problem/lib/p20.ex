defmodule P20 do

  @doc """
  iex> P20.solve 10
  27
  iex> P20.solve 100
  648
  """
  def solve(num) do
    factorial = 1..num |> Enum.reduce(&Kernel.*/2)
    factorial |> Integer.digits |> Enum.sum
  end
end