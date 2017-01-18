defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / year_in_seconds(planet)
  end

  defp year_in_seconds(:earth), do: 1_000_000_000 / 31.69
  defp year_in_seconds(:mercury), do: 2_134_835_688 / 280.88
  defp year_in_seconds(:venus), do: 189_839_836 / 9.78
  defp year_in_seconds(:mars), do: 2_329_871_239 / 39.25
  defp year_in_seconds(:jupiter), do: 901_876_382 / 2.41
  defp year_in_seconds(:saturn), do: 3_000_000_000 / 3.23
  defp year_in_seconds(:uranus), do: 3_210_123_456 / 1.21
  defp year_in_seconds(:neptune), do: 8_210_123_456 / 1.58

end
