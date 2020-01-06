class Array
  def accumulate
    return to_enum unless block_given?

    each_with_object([]) {|element, result| result << yield(element)}
  end
end
