defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part({fun, _, args} = ast, acc) when fun in [:def, :defp] do
    {ast, [get_secret_message(args) | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp get_secret_message([{:when, _, args}, _]),
    do: get_secret_message(args)

  defp get_secret_message([{name, _, arity} | _]) when is_list(arity),
    do: name |> Atom.to_string() |> String.slice(0, length(arity))

  defp get_secret_message(_args),
    do: ""

  def decode_secret_message(string) do
    {_ast, acc} =
      string
      |> to_ast()
      |> Macro.prewalk([], &decode_secret_message_part(&1, &2))

    acc
    |> Enum.reverse()
    |> Enum.join("")
  end
end
