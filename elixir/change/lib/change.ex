defmodule Change do
  @doc """
    FAIL
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}

  def generate(_, target) when target < 0, do: {:error, "cannot change"}
  def generate(_, 0), do: {:ok, []}
  def generate(coins, target) do
    coins
    |> Enum.reverse()
    |> make_change(target, [], coins, target)
    |> case do
      [] -> {:error, "cannot change"}
      change -> {:ok, change}
    end
  end

  defp make_change([], 0, change, _, _) do
    change
  end

  defp make_change([], _, [], _, _) do
    []
  end

  defp make_change([], _, [_ | [_ | _]], _, _) do
    []
  end

  defp make_change([], _, [_ | []] = change, initial_coins, initial_target) do
    generate(initial_coins -- change, initial_target)
  end

  # defp make_change([], target, [_ | [_ | _]], [smallest_coin | _], _) when target < smallest_coin do
  #   []
  # end

  defp make_change([coin | rest], target, change, initial_coins, initial_target) when coin > target do
    make_change(rest, target, change, initial_coins, initial_target)
  end

  defp make_change([coin | _] = coins, target, change, initial_coins, initial_target) when target >= coin do
    make_change(coins, target - coin, [coin] ++ change, initial_coins, initial_target)
  end
end
