defmodule TakeANumber do
  def start() do
    spawn(fn -> machine() end)
  end

  defp machine(state \\ 0) do
    receive do
      {:report_state, from} ->
        send(from, state)
        machine(state)

      {:take_a_number, from} ->
        state = state + 1
        send(from, state)
        machine(state)

      :stop ->
        true

      _unknown ->
        machine(state)
    end
  end
end
