defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    reference = String.downcase(base)

    candidates
    |> Enum.filter(&(String.downcase(&1) != reference))
    |> Enum.filter(&(is_anagram?(&1, count_letters(reference))))
  end

  defp is_anagram?(word, base_count) do
    String.downcase(word)
    |> count_letters
    |> Kernel.==(base_count)
  end

  defp count_letters(word) do
    word
    |> String.split("", trim: true)
    |> Enum.reduce(%{}, fn(letter, counter) -> Map.update(counter, letter, 1, &(&1 + 1)) end)
  end
end
