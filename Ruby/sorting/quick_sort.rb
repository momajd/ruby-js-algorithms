# Quicksort
# O(n log(n)) avg time, O(n^2) worst case time, O(1) memory

def quicksort(arr, start_idx = 0, length = arr.length)
  return arr if length <= 1

  pivot_idx = partition(arr, start_idx, length)
  left_length = pivot_idx - start_idx
  right_length = length - left_length - 1

  quicksort(arr, start_idx, left_length)
  quicksort(arr, pivot_idx  + 1, right_length)
  arr
end

def partition(arr, start_idx, length)

  pivot_idx = start_idx

  (start_idx + 1...start_idx + length).each do |i|
    if arr[i] < arr[pivot_idx]
      temp = arr[i]
      arr[i] = arr[pivot_idx + 1]
      arr[pivot_idx + 1] = arr[pivot_idx]
      arr[pivot_idx] = temp
      pivot_idx += 1
    end
  end
  pivot_idx
end
