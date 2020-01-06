defmodule StringSeries do

  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_, size) when size < 1, do: []
  def slices(s, size) when size == 1, do: String.codepoints(s)
  def slices("", _), do: []
  def slices(<<_::binary-size(1), rest::binary>> = s, size) do
    {slice, _} = String.split_at(s, size)

    if String.length(slice) == size, do: [slice | slices(rest, size)], else: []
  end
end
