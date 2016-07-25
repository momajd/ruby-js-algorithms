// Mergesort
// O(n log(n)) time, O(n) space

function merge(arr1, arr2) {
  var mergedArr = [];

  while (arr1.length !== 0 && arr2.length !== 0) {
    if (arr1[0] < arr2[0]) {
      mergedArr.push(arr1.shift());
    } else {
      mergedArr.push(arr2.shift());
    }
  }
  return mergedArr.concat(arr1, arr2);
}

function mergeSort(arr) {
  if (arr.length <= 1) {return arr;}

  var pivotIdx = Math.floor(arr.length / 2);
  var left = arr.slice(0, pivotIdx);
  var right = arr.slice(pivotIdx);

  return merge(mergeSort(left), mergeSort(right));
}
