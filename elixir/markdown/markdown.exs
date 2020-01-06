defmodule Markdown do

  @spec parse(String.t()) :: String.t()
  def parse(text) do
    if String.contains?(text, "\n") do
      text
      |> String.split("\n")
      |> process()
    else
      process(text)
    end
  end

  defp process(text) when is_list(text) do
    text
    |> Enum.map_join(&process/1)
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_trailing("</li>", "</li></ul>")
  end

  defp process(<<"# ", text::binary>>) do
    "<h1>#{text}</h1>"
  end
  defp process(<<"## ", text::binary>>) do
    "<h2>#{text}</h2>"
  end
  defp process(<<"###### ", text::binary>>) do
    "<h6>#{text}</h6>"
  end

  defp process(<<"* ", text::binary>>) do
    "<li>#{replace_with_tags(text)}</li>"
  end

  defp process(text) do
    "<p>#{replace_with_tags(text)}</p>"
  end

  defp replace_with_tags(text) do
    text
    |> String.split(" ")
    |> Enum.map_join(" ", &replace_markdown/1)
  end

  defp replace_markdown(word) do
    cond do
      String.contains?(word, "__") ->
        word |> String.replace_leading("__", "<strong>") |> String.replace_trailing("__", "</strong>")
      String.contains?(word, "_") ->
        word |> String.replace_leading("_", "<em>") |> String.replace_trailing("_", "</em>")
      true ->
        word
    end
  end
end
