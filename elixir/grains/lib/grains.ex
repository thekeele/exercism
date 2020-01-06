defmodule Grains do
  @range 1..64

  @spec square(pos_integer) :: pos_integer
  def square(number) when number in @range,
    do: {:ok, pow(number)}
  def square(_),
    do: {:error, "The requested square must be between 1 and 64 (inclusive)"}

  @spec total :: pos_integer
  def total(),
    do: {:ok, Enum.reduce(@range, 0, &(pow(&1) + &2))}

  defp pow(number, base \\ 2),
    do: base |> :math.pow(number - 1) |> round()
end
