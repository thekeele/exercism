defmodule Change do
  @doc """
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
  def generate(coins, target) do
    {:ok, _pid} = VendingMachine.start_link()

    coins
    |> Enum.reverse()
    |> make_change(target)
  end

  defp make_change(_coins, 0), do: {:ok, VendingMachine.get()}

  defp make_change([], _target), do: {:error, "cannot change"}

  defp make_change(_coins, target) when target < 0, do: {:error, "cannot change"}

  defp make_change(coins, target) do
    # coins = [4, 5]
    # expected = [4, 4, 4, 5, 5, 5]
    # assert Change.generate(coins, 27) == {:ok, expected}


    Enum.map(coins, fn coin ->
      cond do
        coin > target ->
          # IO.inspect({coin, target}, label: "\n too big")
          make_change(List.delete_at(coins, 0), target)

        coin <= target ->
          remaining = target - coin
          # IO.inspect({coin, target, remaining}, label: "\n can make change")

          if coin <= remaining do
            IO.inspect({coin, target, remaining}, label: "\n can make change with same coin")
            VendingMachine.put(coin)
            make_change(coins, remaining)
          else
            IO.inspect({coin, target, remaining}, label: "\n can make change with new coin")

            make_change(List.delete_at(coins, 0), target - coin)
          end
      end
    end)
  end
end

defmodule VendingMachine do
  use Agent

  def start_link() do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def get do
    Agent.get(__MODULE__, & &1)
  end

  def put(value) do
    Agent.update(__MODULE__, fn machine -> [value | machine] end)
  end
end
