defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes
    |> Enum.filter(&(Regex.match?(~r/[(){}\[\]]/, &1)))
    |> match_brackets([])
  end

  defp match_brackets([], []), do: true
  defp match_brackets([], _), do: false

  defp match_brackets(["}" | rest], ["{" | open_brackets]),
    do: match_brackets(rest, open_brackets)
  defp match_brackets([")" | rest], ["(" | open_brackets]),
    do: match_brackets(rest, open_brackets)
  defp match_brackets(["]" | rest], ["[" | open_brackets]),
    do: match_brackets(rest, open_brackets)

  defp match_brackets([next_bracket | rest], open_brackets) do
    if Regex.match?(~r/[{(\[]/, next_bracket) do
      match_brackets(rest, [next_bracket | open_brackets])
    else
      false
    end
  end
end
