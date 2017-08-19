defmodule P4 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  @doc """
  ## Examples
    iex> P4.is_palindrome 9009
    true
    iex> P4.solve 2
    9009
    iex> P4.solve 3
    906609
  """
  def solve(size) do
    s = :math.pow(10, size - 1)
      |> round
    e = :math.pow(10, size) - 1
      |> round
    for a <- s..e, b <- s..e do
      {a, b}
    end
    |> Enum.filter(fn {a, b} -> is_palindrome(a * b) end)
    |> Enum.map(fn {a, b} -> a * b end)
    |> Enum.max
  end


  def is_palindrome(num) do
    digits = Integer.digits(num)
    digits == Enum.reverse(digits)
  end
end
