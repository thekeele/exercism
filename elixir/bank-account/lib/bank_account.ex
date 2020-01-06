defmodule BankAccount do
  use GenServer

  @opaque account :: pid

  @spec open_bank() :: account
  def open_bank() do
    {:ok, pid} = GenServer.start_link(__MODULE__, :ok)
    pid
  end

  @spec close_bank(account) :: none
  def close_bank(account) do
    GenServer.cast(account, :close)
  end

  @spec balance(account) :: integer | {:error, :account_closed}
  def balance(account) do
    GenServer.call(account, :balance)
  end

  @spec update(account, integer) :: integer | {:error, :account_closed}
  def update(account, amount) do
    GenServer.call(account, {:update, amount})
  end

  def init(:ok) do
    {:ok, %{balance: 0}}
  end

  def handle_cast(:close, _) do
    {:noreply, %{}}
  end

  def handle_call(:balance, _from, bank) do
    {:reply, get_balance(bank), bank}
  end

  def handle_call({:update, amount}, _from, bank) do
    {:ok, bank} = update_balance(bank, amount)
    {:reply, get_balance(bank), bank}
  end

  defp get_balance(%{balance: balance}), do: balance
  defp get_balance(_), do: {:error, :account_closed}

  defp update_balance(%{balance: balance} = bank, amount),
    do: {:ok, %{bank | balance: balance + amount}}
  defp update_balance(_, _),
    do: {:ok, %{}}
end
