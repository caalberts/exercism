defmodule SecretHandshake do
  use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> handshake(match(code, 0b1000), "jump")
    |> handshake(match(code, 0b100), "close your eyes")
    |> handshake(match(code, 0b10), "double blink")
    |> handshake(match(code, 0b1), "wink")
    |> handshake(match(code, 0b10000), &Enum.reverse/1)
  end

  defp handshake(acc, false, _), do: acc
  defp handshake(acc, true, word) when is_binary(word), do: [word | acc]
  defp handshake(acc, true, fun), do: fun.(acc)

  defp match(code, bits) do
    (code &&& bits) == bits
  end

end
