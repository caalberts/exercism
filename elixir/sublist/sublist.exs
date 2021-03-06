defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(left, right) when length(left) > length(right), do: false
  defp sublist?(left, right=[_|right_tail]) do
    if list_match?(left, right) do
      true
    else
      sublist?(left, right_tail)
    end
  end

  defp list_match?([], _), do: true
  defp list_match?([a|left_tail], [a|right_tail]) do
    left_tail
    |> list_match?(right_tail)
  end
  defp list_match?(_, _), do: false
end
