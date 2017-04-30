defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())


  def slices(s, size) do
    _slices(String.graphemes(s), size)
  end

  def _slices(_, size) when size < 1, do: []
  def _slices([], _), do: []
  def _slices(s = [head | tail], size) do
    [ Enum.slice(s, (0..size-1)) | _slices(tail, size) ]

    # num_slices = String.length(s) - size
    # graphemes = String.graphemes(s)
    # (0..num_slices)
    # |> Enum.map(&map_to_series(&1, graphemes, size))
  end
end
