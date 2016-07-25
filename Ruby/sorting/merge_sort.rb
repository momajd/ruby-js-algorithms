# Mergesort
# O(n log(n)) time, O(n) space

def merge(arr1, arr2)
  merged_arr = []

  until (arr1.empty? || arr2.empty?)
    arr1[0] < arr2[0] ? merged_arr.push(arr1.shift) : merged_arr.push(arr2.shift)
  end

  merged_arr.concat(arr1).concat(arr2)
end

def merge_sort(arr)
  return arr if arr.length <= 1

  pivot_idx = arr.length / 2
  left = arr[0...pivot_idx]
  right = arr[pivot_idx...arr.length]

  merge(merge_sort(left), merge_sort(right))
end
