defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..limit-1
    # |> Enum.filter(&(is_multiple_any?(&1, factors)))
    |> Enum.filter(&(is_multiple?(&1, factors)))
    |> Enum.sum
  end

  defp is_multiple?(num, []), do: false
  defp is_multiple?(num, [head | _]) when rem(num, head) == 0, do: true
  defp is_multiple?(num, [_ | tail]), do: is_multiple?(num, tail)

  defp is_multiple_any?(num, factors) do
    factors
    |> Enum.any?(&(rem(num, &1) == 0))
  end
end
