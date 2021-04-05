defmodule ArmstrongNumber do
  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    num_digits = length(digits)
    sum_of_digits =
      for digit <- digits, reduce: 0 do
        sum -> sum + :math.pow(digit, num_digits)
      end

    number == sum_of_digits
  end
end
