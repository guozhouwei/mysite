import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor {

/**
 * quicksort
 **/
  func sort(arr:[var Int], low:Nat, high:Nat) {
    if(low >= high) return;
    var temp = arr[low];
    var left = low;
    var right = high;
    while (left < right) {
        while(arr[right] >= temp and right > left) {
            right -= 1;
        };
        arr[left] := arr[right];
        while(arr[left] <= temp and left < right) {
          left += 1;
        };
        arr[right] := arr[left];
    };
    arr[right] := temp;

    if(left >= 1) {
      sort(arr, low, left-1);
    };
    sort(arr, left+1, high);
  };

  /**
   * sort
   **/
  public func qsort(arr : [Int]): async [Int] {
    /// Transform an immutable array into a mutable array.
    var newArr:[var Int] = Array.thaw(arr);
    //快排
    sort(newArr, 0, newArr.size()-1);
    /// Transform mutable array into immutable array
    Array.freeze(newArr);
  };
};
