defmodule DNA do
  @moduledoc """
  | Nucleic Acid | Code   |
  | ------------ | ------ |
  | a space      | `0000` |
  | A            | `0001` |
  | C            | `0010` |
  | G            | `0100` |
  | T            | `1000` |
  """

  @dna %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  def encode_nucleotide(code_point) do
    @dna[code_point]
  end

  def decode_nucleotide(encoded_code) do
    @dna
    |> Enum.find(fn {_key, value} -> value == encoded_code end)
    |> elem(0)
  end

  def encode(dna) do
    do_encode(dna, <<0::0>>)
  end

  defp do_encode([], acc), do: acc

  defp do_encode([dna | rest], acc) do
    do_encode(rest, <<acc::bitstring, encode_nucleotide(dna)::4>>)
  end

  def decode(dna) do
    do_decode(dna, '')
  end

  defp do_decode(<<0::0>>, acc), do: Enum.reverse(acc)

  defp do_decode(<<dna::4, rest::bitstring>>, acc) do
    do_decode(rest, [decode_nucleotide(dna) | acc])
  end
end
