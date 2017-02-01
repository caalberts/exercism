defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    prepare(word)
    |> Enum.map(&(get_score(&1)))
    |> Enum.reduce(0, &(&1 + &2))
  end

  defp prepare(word) do
    word
    |> String.upcase
    |> String.split("", trim: true)
  end

  defp get_score(letter) do
    cond do
      String.contains?("AEIOULNRST", letter) -> 1
      String.contains?("DG", letter) -> 2
      String.contains?("BCMP", letter) -> 3
      String.contains?("FHVWY", letter) -> 4
      String.contains?("K", letter) -> 5
      String.contains?("JX", letter) -> 8
      String.contains?("QZ", letter) -> 10
      true -> 0
    end
  end
end
