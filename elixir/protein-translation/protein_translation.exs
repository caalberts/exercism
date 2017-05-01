defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    try do
      result = split_rna([], rna)
      |> Enum.map(&(of_codon(&1)))
      |> Enum.map(&(filter_invalid(&1)))
      |> translate([])

      { :ok, result }
    rescue
      e in RuntimeError -> { :error, e.message }
    end

  end

  defp split_rna(acc, ""), do: acc
  defp split_rna(acc, rna) do
    { codon, rest } = String.split_at(rna, 3)
    split_rna(acc ++ [codon], rest)
  end

  defp filter_invalid({:error, _}), do: raise "invalid RNA"
  defp filter_invalid({:ok, _} = result), do: result

  defp translate([], acc), do: acc
  defp translate([{:ok, "STOP"} | _], acc), do: acc
  defp translate([{:ok, protein} | t], acc), do: translate(t, acc ++ [protein])

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    try do
      {:ok, _} = Map.fetch(proteins(), codon)
    rescue
      MatchError -> {:error, "invalid codon"}
    end
  end

  defp proteins do
    %{
      "UGU" => "Cysteine",
      "UGC" => "Cysteine",
      "UUA" => "Leucine",
      "UUG" => "Leucine",
      "AUG" => "Methionine",
      "UUU" => "Phenylalanine",
      "UUC" => "Phenylalanine",
      "UCU" => "Serine",
      "UCC" => "Serine",
      "UCA" => "Serine",
      "UCG" => "Serine",
      "UGG" => "Tryptophan",
      "UAU" => "Tyrosine",
      "UAC" => "Tyrosine",
      "UAA" => "STOP",
      "UAG" => "STOP",
      "UGA" => "STOP"
    }
  end
end
