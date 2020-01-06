defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}
  defstruct data: nil, left: nil, right: nil

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data),
    do: %__MODULE__{data: data}

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, data),
    do: new(data)
  def insert(%__MODULE__{data: parent, left: left} = node, data) when parent >= data,
    do: %{node | left: insert(left, data)}
  def insert(%__MODULE__{data: parent, right: right} = node, data) when parent < data,
    do: %{node | right: insert(right, data)}

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(nil),
    do: []
  def in_order(node),
    do: in_order(node.left) ++ [node.data] ++ in_order(node.right)
end
