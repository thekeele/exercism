defmodule Raindrops do

  @raindrops %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    case modulo(number, Map.keys(@raindrops)) do
      "" -> "#{number}"
      raindrops_sound -> raindrops_sound
    end
  end

  defp modulo(_, []),
    do: ""
  defp modulo(number, [divisor | rest]) when rem(number, divisor) == 0,
    do: @raindrops[divisor] <> modulo(number, rest)
  defp modulo(number, [_ | rest]),
    do: "" <> modulo(number, rest)
end
