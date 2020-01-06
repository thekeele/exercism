defmodule LinkedList do
  @opaque t :: tuple()
  defstruct [:data, :next]

  @doc """
  Create a new LinkedList struct with nil values
  """
  @spec new() :: t
  def new(),
    do: %__MODULE__{}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(%__MODULE__{} = list, elem),
    do: %{new() | data: elem, next: list}

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(%__MODULE__{next: nil}),
    do: 0

  def length(%__MODULE__{next: list}),
    do: 1 + __MODULE__.length(list)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(%__MODULE__{data: nil}),
    do: true

  def empty?(_),
    do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(%__MODULE__{data: nil}),
    do: {:error, :empty_list}

  def peek(%__MODULE__{data: data}),
    do: {:ok, data}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(%__MODULE__{next: nil}),
    do: {:error, :empty_list}

  def tail(list),
    do: {:ok, list.next}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(%__MODULE__{next: nil}),
    do: {:error, :empty_list}

  def pop(list),
    do: {:ok, list.data, list.next}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list([]),
    do: new()

  def from_list([head | rest]),
    do: %__MODULE__{data: head, next: from_list(rest)}

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(%__MODULE__{next: nil}),
    do: []

  def to_list(list),
    do: [list.data] ++ to_list(list.next)

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list, reverse \\ new())

  def reverse(%__MODULE__{next: nil}, reverse),
    do: reverse

  def reverse(list, reverse),
    do: reverse(list.next, %{reverse | data: list.data, next: reverse})
end
