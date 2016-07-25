function partition (arr, startIdx, length) {
  var pivotIdx = startIdx;

  for (var i = startIdx + 1; i < startIdx + length; i++) {
    if (arr[i] < arr[pivotIdx]) {
      var temp = arr[i];
      arr[i] = arr[pivotIdx + 1];
      arr[pivotIdx + 1] = arr[pivotIdx];
      arr[pivotIdx] = temp;
      pivotIdx++;
    }
  }
  return pivotIdx;
}

function quicksort (arr, startIdx, length) {
  startIdx = typeof startIdx !== 'undefined' ? startIdx : 0;
  length = typeof length !== 'undefined' ? length : arr.length;

  if (length <= 1) return arr;

  var pivotIdx = partition(arr, startIdx, length);
  var leftLength = pivotIdx - startIdx;
  var rightLength = length - leftLength - 1;

  quicksort(arr, startIdx, leftLength);
  quicksort(arr, pivotIdx + 1, rightLength);

  return arr;
}
