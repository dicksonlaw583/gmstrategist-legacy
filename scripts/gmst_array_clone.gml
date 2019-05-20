///gmst_array_clone(arr)
/**
Return a shallow clone of the given array.
*/
{
  var _oldarr = argument[0];
  var _newarr;
  // 1D mode
  if (array_height_2d(_oldarr) == 1) {
    var _len = array_length_1d(_oldarr);
    _newarr = array_create(_len);
    array_copy(_newarr, 0, _oldarr, 0, _len);
  }
  // 2D mode
  else {
    for (var i = array_height_2d(_oldarr)-1; i >= 0; i--) {
      for (var j = array_length_2d(_oldarr, i); j >= 0; j--) {
        _newarr[i, j] = _oldarr[i, j];
      }
    }
  }
  return _newarr;
}
