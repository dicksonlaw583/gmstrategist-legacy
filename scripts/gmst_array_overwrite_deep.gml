///gmst_array_overwrite_deep(arr, @arrstate)
/**
Overwrite @arrstate entry-wise with the corresponding content of arr in-place, then return undefined.
Notice that if @arrstate is larger than arr, the excess entries will remain unchanged.
If the nesting structure is different, the behaviour is NOT defined.
If @arrstate is undefined, instead create a copy of arr and return the copy.
*/
{
  // Undefined arrstate, call copy
  if (is_undefined(argument1)) {
    return gmst_array_clone_deep(argument0);
  }
  // 1D mode
  if (array_height_2d(argument0) == 1) {
    var _size = array_length_1d(argument0);
    for (var i = 0; i < _size; i++) {
      if (is_array(argument0[i])) {
        gmst_array_overwrite_deep(argument0[i], argument1[i]);
      } else {
        argument1[@ i] = argument0[i];
      }
    }
  }
  // 2D mode
  else {
    for (var i = array_height_2d(argument0)-1; i >= 0; i--) {
      for (var j = array_length_2d(argument0, i)-1; j >= 0; j--) {
        if (is_array(argument0[i, j])) {
          gmst_array_overwrite_deep(argument0[i, j], argument1[i, j]);
        } else {
          argument1[@ i, j] = argument0[i, j];
        }
      }
    }
  }
  return undefined;
}
