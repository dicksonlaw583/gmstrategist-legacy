///gmst_array_overwrite(arr, @arrstate)
/**
Overwrite @arrstate entry-wise with the content of arr in-place, then return undefined.
Notice that if @arrstate is larger than arr, the excess entries will remain unchanged.
If @arrstate is undefined, instead create a copy of arr and return the copy.
*/
{
  // Undefined arrstate, call copy
  if (is_undefined(argument1)) {
    return gmst_array_clone(argument0);
  }
  // 1D mode
  if (array_height_2d(argument0) == 1) {
    var _len = array_length_1d(argument0);
    array_copy(argument1, 0, argument0, 0, _len);
  }
  // 2D mode
  else {
    for (var i = array_height_2d(argument0)-1; i >= 0; i--) {
      for (var j = array_length_2d(argument0, i); j >= 0; j--) {
        argument1[@ i, j] = argument0[i, j];
      }
    }
  }
  return undefined;
}
