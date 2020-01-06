defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """

  @spec verse(integer) :: String.t()
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end
  def verse(number) do
    """
    #{bottles_of_beer(number)} on the wall, #{bottles_of_beer(number)}.
    Take #{beer(number - 1)} down and pass it around, #{bottles_of_beer(number - 1)} on the wall.
    """
  end

  defp bottles_of_beer(bottles) when bottles > 1, do: "#{bottles} bottles of beer"
  defp bottles_of_beer(1), do: "1 bottle of beer"
  defp bottles_of_beer(0), do: "no more bottles of beer"

  defp beer(beer) when beer > 0, do: "one"
  defp beer(0), do: "it"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &verse/1)
  end
end
