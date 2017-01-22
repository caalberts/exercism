defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/\s|_|\W\W/, trim: true)
    |> Enum.reduce(%{}, fn(word, counter) -> Map.update(counter, word, 1, &(&1 + 1))
    end)
  end
end
