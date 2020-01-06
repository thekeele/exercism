defmodule RNATranscription do
  @dna_to_rna %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) when is_list(dna) do
    for strand <- dna, do: @dna_to_rna[strand]
  end
end
