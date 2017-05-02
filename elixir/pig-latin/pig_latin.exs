defmodule PigLatin do
  @vowels ~w(a e i o u yt xr)
  @consonants ~w(sch squ thr ch qu th)

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      Enum.any?(@vowels, &String.starts_with?(word, &1)) ->
        word <> "ay"
      prefix = Enum.find(@consonants, &String.starts_with?(word, &1)) ->
        translate_consonant(word, String.length(prefix))
      true ->
        translate_consonant(word)
    end
  end

  defp translate_consonant(word, split_at \\ 1) do
    {prefix, rest} = String.split_at(word, split_at)
    rest <> prefix <> "ay"
  end
end
