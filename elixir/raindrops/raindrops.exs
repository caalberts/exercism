defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    raindrop(rem(number, 3), rem(number, 5), rem(number, 7), number)
  end

  defp raindrop(0, 0, 0, _), do: "PlingPlangPlong"
  defp raindrop(0, 0, _, _), do: "PlingPlang"
  defp raindrop(0, _, 0, _), do: "PlingPlong"
  defp raindrop(_, 0, 0, _), do: "PlangPlong"
  defp raindrop(0, _, _, _), do: "Pling"
  defp raindrop(_, 0, _, _), do: "Plang"
  defp raindrop(_, _, 0, _), do: "Plong"
  defp raindrop(_, _, _, n), do: Integer.to_string(n)
end
