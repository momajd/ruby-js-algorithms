def bsearch(arr, target)
  return nil if arr.length < 1

  pivot_idx = arr.length / 2
  left = arr[0...pivot_idx]
  right = arr[pivot_idx + 1..-1]

  if arr[pivot_idx] == target
    return pivot_idx
  elsif target < arr[pivot_idx]
    return bsearch(left, target)
  else
    right_result = bsearch(right, target)
    return nil if right_result.nil?
    left.length + 1 + right_result
  end
end
