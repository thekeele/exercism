defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for point <- to_charlist(text), into: "" do
      maybe_rotate(point, shift)
    end
  end

  defp maybe_rotate(<<point::utf8>>, shift)
       when point in ?A..?Z,
    do: <<do_rotate(point, shift, ?A)::utf8>>
  defp maybe_rotate(<<point::utf8>>, shift)
       when point in ?a..?z,
    do: <<do_rotate(point, shift, ?a)::utf8>>
  defp maybe_rotate(point, _),
    do: point

  defp do_rotate(point, shift, start),
    do: rem(point - start + shift, 26) + start
end
