defmodule P32 do
  @doc """
  iex> P32.solve()
  45228
  """
  def solve() do
    1..9
    |> Enum.to_list
    |> Permutation.permutations
    |> Enum.flat_map(&split_into_multiplication(&1))
    |> Enum.filter(fn {l, r, p} -> l * r == p end)
    |> Enum.map(fn {_l, _r, p} -> p end)
    |> MapSet.new
    |> Enum.to_list
    |> Enum.sum
  end

  @doc """
  iex> P32.split_into_multiplication([1, 2, 3, 4])
  [{1, 2, 34}]

  all possible arrangements are  [{1, 2, 34}, {1, 23, 4}, {12, 3, 4}]
  but only {1, 2, 34} may possibly become a valid equation: 1 x 2 = 34
  """
  def split_into_multiplication(lst) do
    len = length(lst)
    for multiplicand_length <- 1..len-2,
        multiplier_length <- 1..(len - multiplicand_length - 1)
    do
      product_length = len - multiplicand_length - multiplier_length
      {multiplicand_length, multiplier_length, product_length}
    end
    |> Enum.filter(fn {l, r, p} -> l <= p && r <= p  end)
    |> Enum.map(fn {l, r, p} ->
      multiplicand = Enum.slice(lst, 0, l) |> Integer.undigits
      multiplier = Enum.slice(lst, l, r) |> Integer.undigits
      product = Enum.slice(lst, l + r, p) |> Integer.undigits
      {multiplicand, multiplier, product}
     end)
  end
end

defmodule Permutation do
  @moduledoc """
  Efficient implementation of permutation using fixed heap algorithm.

  via http://suranyami.com/post/148046566908/permutations-in-elixir
  """

  def permutations([]), do: []
  def permutations(list) when length(list) == 1, do: [list]
  def permutations(list) do
    n = length(list) - 1
    Enum.flat_map(0..n, fn index ->
      value = Enum.at(list, index)
      List.delete_at(list, index) |> permutations |> Enum.map(&([value | &1]))
    end)
  end

  defp swap(list, p1, p2) do
    v1 = Enum.at(list, p1)
    v2 = Enum.at(list, p2)
    list
    |> List.replace_at(p1, v2)
    |> List.replace_at(p2, v1)
  end
end