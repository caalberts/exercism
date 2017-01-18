defmodule Bob do
  def hey(input) do
    cond do
      is_silence?(input) -> "Fine. Be that way!"
      is_question?(input) -> "Sure."
      only_numbers?(input) -> "Whatever."
      is_shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_silence?(string) do
    String.trim(string)
    |> String.length == 0
  end

  defp is_question?(string) do
    string
    |> String.ends_with?("?")
  end

  defp only_numbers?(string) do
    String.equivalent?(String.upcase(string), string) and
    String.equivalent?(String.downcase(string), string)
  end

  defp is_shouting?(string) do
    string
    |> String.equivalent?(String.upcase(string))
  end
end
