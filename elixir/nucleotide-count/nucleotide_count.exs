defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand
    |> Enum.count(&(&1 == nucleotide))
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    @nucleotides
    |> Enum.map(&({&1, count(strand, &1)}))
    |> Enum.into(%{})
  end
end
