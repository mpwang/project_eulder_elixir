defmodule P1 do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """

  @doc """
  iex> P1.solve 10
  23
  iex> P1.solve 1000
  233168
  """
  def solve(num) do
    1..(num - 1)
    |> Enum.filter(fn x -> rem(x, 3) == 0 or rem(x, 5) == 0 end)
    |> Enum.sum
    |> IO.inspect
  end
end
