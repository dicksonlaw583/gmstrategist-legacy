///gmst_array_clone_deep(arr)
/**
Return a recursive clone of the given array.
*/
{
  var _oldarr = argument[0];
  var _newarr;
  // 1D mode
  if (array_height_2d(_oldarr) == 1) {
    var _size = array_length_1d(_oldarr);
    _newarr = array_create(_size);
    for (var i = 0; i < _size; i++) {
      if (is_array(_oldarr[i])) {
        _newarr[i] = gmst_array_clone_deep(_oldarr[i]);
      } else {
        _newarr[i] = _oldarr[i];
      }
    }
  }
  // 2D mode
  else {
    for (var i = array_height_2d(_oldarr)-1; i >= 0; i--) {
      for (var j = array_length_2d(_oldarr, i)-1; j >= 0; j--) {
        if (is_array(_oldarr[i, j])) {
          _newarr[i, j] = gmst_array_clone_deep(_oldarr[i, j]);
        } else {
          _newarr[i, j] = _oldarr[i, j];
        }
      }
    }
  }
  return _newarr;
}
