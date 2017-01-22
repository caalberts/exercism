defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> exclude_punctuations
    |> count_words
  end

  defp exclude_punctuations(words) do
    words
    |> String.split("")
    |> Enum.filter(&(allowed_character?(&1)))
    |> Enum.join("")
  end

  defp allowed_character?(char) do
    Regex.match?(~r/\w|\s|\-|\_/, char)
  end

  defp count_words(sentence) do
    sentence
    |> String.split([" ", "_"])
    |> Enum.reduce(%{}, &counter/2)
  end

  defp counter(word, count) do
    if String.length(word) > 0 do
      Dict.update(count, String.downcase(word), 1, &(&1 + 1))
    else
      count
    end
  end
end
