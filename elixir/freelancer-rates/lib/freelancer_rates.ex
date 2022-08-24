defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(22)
    |> do_apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> do_apply_discount(discount)
    |> then(&Float.floor(budget / &1, 1))
  end

  defp do_apply_discount(rate, 0.0), do: rate
  defp do_apply_discount(rate, discount), do: apply_discount(rate, discount)
end
