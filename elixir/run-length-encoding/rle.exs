defmodule RunLengthEncoder do

  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(string) do
    string
    |> String.codepoints()
    |> Enum.chunk_by(& &1)
    |> Enum.into("", fn [char | _] = list ->
      len = length(list)
      if len > 1, do: "#{len}#{char}", else: char
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""
  def decode(string) do
    string
    |> String.split(~r/[1-99]{0,2}[a-zA-Z]|[1-99]{0,2}\s/, include_captures: true, trim: true)
    |> Enum.map(&String.split(&1, ~r/[a-zA-Z]|\s/, include_captures: true, trim: true))
    |> Enum.into("", fn
      [char | []] -> char
      [number | [char | _]] -> String.duplicate(char, String.to_integer(number))
    end)
  end
end
