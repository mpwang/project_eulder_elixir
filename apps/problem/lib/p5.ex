defmodule P5 do
  @moduledoc """
  """

  @doc """
  iex> P5.lcm 12, 18
  36
  iex> P5.solve 10
  2520
  iex> P5.solve 20
  232792560
  """
  def solve(limit) do
    1..limit |> Enum.reduce(&lcm/2)
  end

  def gcd(a, 0), do: abs(a)
  def gcd(a, b), do: gcd(b, rem(a, b))
  def lcm(a, b), do: div(abs(a * b), gcd(a, b))
end
