defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    rna
    |> String.graphemes
    |> Enum.chunk(3)
    |> Enum.map(&List.to_string/1)
    |> Enum.reduce_while({:ok, []}, &translate/2)
  end

  defp translate(codon, {_, translation}) do
    case of_codon(codon) do
      {:ok, "STOP"} -> {:halt, {:ok, translation}}
      {:ok, protein} -> {:cont, {:ok, translation ++ [protein]}}
      {:error, _} -> {:halt, {:error, "invalid RNA"}}
    end
  end

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
