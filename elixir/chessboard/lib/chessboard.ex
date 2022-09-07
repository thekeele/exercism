defmodule Chessboard do
  def rank_range, do: 1..8

  def file_range, do: ?A..?H

  def ranks, do: Enum.into(rank_range(), [])

  def files, do: Enum.into(file_range(), [], &<<&1::utf8>>)
end
