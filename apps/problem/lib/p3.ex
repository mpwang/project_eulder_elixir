defmodule P3 do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
  """

  @doc """
  key realization: every number n can at most have one prime factor greater than n's square root.

  If we, after dividing out some prime factor, calculate the square root of the remaining number
  we can use that square root as upper limit for factor. If factor exceeds this square root
  we know the remaining number is prime.

  iex> P3.solve 3
  3
  iex> P3.solve 14
  7
  iex> P3.solve 13195
  29
  iex> P3.solve 600851475143
  6857
  """
  def solve(num) do
    {reminder, max_factor} = rm(num, 2)
    do_solve(reminder, max_factor, 3)
  end
  defp do_solve(reminder, _, factor) when reminder <= 1 do
    factor
  end
  defp do_solve(reminder, max_factor, factor) when max_factor <= factor do
    reminder
  end
  defp do_solve(reminder, max_factor, factor) do
    if rem(reminder, factor) == 0 do
      {reminder, max_factor} = rm(reminder, factor)
      do_solve(reminder, max_factor, factor)
    else
      do_solve(reminder, max_factor, factor + 2)
    end
  end

  @doc """
    remove the factor from number
    return the reminder and the square root of the reminder
  """
  def rm(num, factor) do
    if rem(num, factor) == 0 do
      rm div(num, factor), factor
    else
      {num, fsqrt(num)}
    end
  end

  defp fsqrt(num) do
    :math.sqrt(num) |> Float.floor
  end
end
