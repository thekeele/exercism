class Matrix
  def initialize(matrix_string)
    matrix = matrix_string.split("\n").map{|s| s.split(" ").map(&:to_i)}
    @rows = matrix.first.length
    @columns = matrix_string.count("\n") + 1
    @matrix = matrix.flatten
  end

  def rows
    @matrix.each_slice(@rows).to_a
  end

  def columns
    (0..@rows - 1).map do |i|
      (0..@columns - 1).map do |j|
        @matrix[((j * @rows) + i)]
      end
    end
  end
end
