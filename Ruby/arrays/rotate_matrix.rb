# CCI 1.7 Rotate NxN Matrix

def rotate_matrix(matrix)
  # rotated = Array.new(matrix[0].length) {Array.new(matrix.length)}

  matrix.each_with_index do |row, i|
    row.length.times do |j|
      new_i = j
      new_j = matrix.length - 1 - i
      rotated[new_i][new_j] = matrix[i][j]
    end
  end
  rotated
end
