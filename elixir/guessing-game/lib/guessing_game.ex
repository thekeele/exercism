defmodule GuessingGame do
  def compare(secret_number, guess \\ nil)

  def compare(_secret_number, guess)
      when not is_integer(guess), do: "Make a guess"

  def compare(secret_number, guess)
      when secret_number == guess, do: "Correct"

  def compare(secret_number, guess)
      when secret_number == guess + 1 or secret_number == guess - 1, do: "So close"

  def compare(secret_number, guess)
      when secret_number < guess, do: "Too high"

  def compare(secret_number, guess)
      when secret_number > guess, do: "Too low"
end
