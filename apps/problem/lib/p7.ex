defmodule P7 do  

  @doc """
  iex> P7.solve 10001
  104743
  """
  def solve(limit) do
    primes_below(limit, 3, [2]) |> List.last
  end

  def primes_below(limit), do: primes_below(limit, 3, [2])
  def primes_below(limit, _, acc) when length(acc) >= limit, do: Enum.reverse(acc)
  def primes_below(limit, num, acc) do
    prime? =
      acc
      |> Enum.reverse
      |> Enum.take(length(acc) |> :math.sqrt |> round)
      |> Enum.all?(fn x-> rem(num, x) != 0 end)

    if prime? do
      primes_below(limit, num + 2, [num | acc])
    else
      primes_below(limit, num + 2, acc)
    end
  end
end
