defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    case Time.compare(datetime, ~T[12:00:00Z]) do
      :lt -> true
      _gt_or_eq -> false
    end
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      Date.add(checkout_datetime, 28)
    else
      Date.add(checkout_datetime, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case Date.compare(planned_return_date, actual_return_datetime) do
      :eq -> 0
      :gt -> 0
      :lt -> Date.diff(actual_return_datetime, planned_return_date)
    end
  end

  def monday?(datetime) do
    case :calendar.day_of_the_week(datetime.year, datetime.month, datetime.day) do
      1 -> true
      _not_monday -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)

    checkout_datetime
    |> return_date()
    |> days_late(actual_return_datetime)
    |> case do
      0 -> 0
      days_late -> calculate_fee(actual_return_datetime, days_late, rate)
    end
  end

  defp calculate_fee(actual_return_datetime, days_late, rate) do
    fee = days_late * rate

    if monday?(actual_return_datetime), do: Float.floor(fee * 0.5, 0), else: fee
  end
end
