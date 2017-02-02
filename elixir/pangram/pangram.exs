defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    count = sentence
            |> String.upcase
            |> get_letters
            |> List.flatten
            |> MapSet.new
            |> MapSet.size

    count == 26
  end

  defp get_letters(sentence) do
    Regex.scan(~r/[A-Za-z]/, sentence)
  end
end
