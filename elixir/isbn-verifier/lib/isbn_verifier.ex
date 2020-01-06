defmodule IsbnVerifier do
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    digits = String.replace(isbn, "-", "")
    if String.length(digits) === 10, do: check_digits(digits, 0), else: false
  end

  defp check_digits("", sum), do: rem(sum, 11) === 0

  defp check_digits(<<"X", "">>, sum), do: check_digits("", 10 * 1 + sum)

  defp check_digits(<<digit::binary-size(1), rest::binary()>> = digits, sum) do
    case Integer.parse(digit) do
      {digit, ""} -> check_digits(rest, digit * String.length(digits) + sum)
      :error -> false
    end
  end
end
