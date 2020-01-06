defmodule TwoFer do
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you")
  def two_fer(name) when is_binary(name), do: "One for #{name}, one for me"
  def two_fer(_), do: raise FunctionClauseError
end
