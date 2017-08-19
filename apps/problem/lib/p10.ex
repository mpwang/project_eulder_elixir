defmodule P10 do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  @doc """
  iex> P10.solve 10
  17
  iex> P10.solve 2_000_000
  142913828922
  """
  def solve(limit) do
    Math.Primes.sieve
    |> Stream.take_while(fn num -> num < limit end)
    |> Enum.sum
  end
end
