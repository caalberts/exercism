defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    String.codepoints(string)
    |> rle([])
    |> Enum.map(fn ({letter, count}) -> "#{count}#{letter}" end)
    |> Enum.join
  end

  defp rle([], code), do: Enum.reverse(code)
  defp rle([head | tail], [{head, count} | code]), do: rle(tail, [{head, count + 1} | code])
  defp rle([head | tail], code), do: rle(tail, [{head, 1} | code])


  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\w)/, string)
    |> Enum.map(fn([_, count, letter]) -> String.duplicate(letter, String.to_integer(count)) end)
    |> Enum.join
  end
end
