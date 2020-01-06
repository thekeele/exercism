defmodule Hamming do
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance('', ''),
    do: {:ok, 0}

  def hamming_distance(strand1, strand2) when strand1 === strand2,
    do: {:ok, 0}

  def hamming_distance(strand1, strand2) when length(strand1) !== length(strand2),
    do: {:error, "Lists must be the same length"}

  def hamming_distance(strand1, strand2) do
    hamming_distance =
      strand1
      |> Enum.zip(strand2)
      |> Enum.reduce(0, fn
        {l_strand, r_strand}, distance when l_strand !== r_strand -> 1 + distance
        _, distance -> distance
      end)

    {:ok, hamming_distance}
  end
end
