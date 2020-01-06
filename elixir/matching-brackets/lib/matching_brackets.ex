defmodule MatchingBrackets do
  @matches %{"]" => "[", "}" => "{", ")" => "("}

  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints()
    |> Enum.reduce([], &match/2)
    |> Enum.empty?()
  end

  defp match(bracket, brackets) when bracket in ["[", "{", "("] do
    brackets ++ [bracket]
  end

  defp match(bracket, brackets) when bracket in ["]", "}", ")"] do
    if @matches[bracket] in brackets do
      List.delete_at(brackets, -1)
    else
      brackets ++ [bracket]
    end
  end

  defp match(_, brackets) do
    brackets
  end
end
