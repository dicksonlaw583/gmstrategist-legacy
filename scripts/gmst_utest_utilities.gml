///gmst_utest_utilities()
var got, expected, fixture;

// GmstArray
expected = array_create(3);
expected[0] = 1;
expected[1] = 2;
expected[2] = 3;
got = GmstArray(1, 2, 3);
assert_equal(got, expected, "GmstArray failed!");
got = undefined;
expected = undefined;

// GmstArray2
expected = undefined;
expected[0, 0] = "a";
expected[0, 1] = "b";
expected[1, 0] = "c";
expected[1, 1] = "d";
got = GmstArray2(2, 2,
  "a", "b",
  "c", "d"
);
assert_equal(got, expected, "GmstArray2 failed!");
got = undefined;
expected = undefined;

// GmstLattice
expected = undefined;
expected[0, 0] = "A";
expected[0, 1] = "C";
expected[0, 2] = "E";
expected[1, 0] = "B";
expected[1, 1] = "D";
expected[1, 2] = "F";
got = GmstLattice(2, 3,
  "A", "B",
  "C", "D",
  "E", "F"
);
assert_equal(got, expected, "GmstArray2 failed!");
// lattice_get_width
assert_equal(lattice_get_width(got), 2, "lattice_get_width failed!");
// lattice_get_height
assert_equal(lattice_get_height(got), 3, "lattice_get_width failed!");
got = undefined;
expected = undefined;

// gmst_identity
assert_equal(gmst_identity(6), 6, "gmst_identity failed!");
assert_equal(gmst_identity("a", "b"), "a", "gmst_identity failed!");
assert_equal(script_execute(gmst_identity, 6), 6, "gmst_identity failed!");
assert_equal(script_execute(gmst_identity, "a", "b"), "a", "gmst_identity failed!");

// gmst_array_clone
fixture = GmstArray(4, 5, 6, 7);
expected = GmstArray(4, 5, 6, 7);
got = gmst_array_clone(fixture);
assert_equal(got, fixture, "gmst_array_clone failed!");
fixture[0] = 9;
assert_equal(got, expected, "gmst_array_clone did not create an independent copy!");
got = undefined;
expected = undefined;
fixture = undefined;

// gmst_array_clone_deep
fixture = GmstArray(4, "five", GmstArray(6, 7), GmstArray2(2, 2, 0, 1, 2, 3));
expected = GmstArray(4, "five", GmstArray(6, 7), GmstArray2(2, 2, 0, 1, 2, 3));
got = gmst_array_clone_deep(fixture);
assert_equal(got, fixture, "gmst_array_clone_deep failed!");
fixture[0] = 9;
assert_equal(got, expected, "gmst_array_clone_deep did not create an independent copy!");
var fixture_subarray = fixture[2];
fixture_subarray[@ 0] = 5;
assert_equal(got, expected, "gmst_array_clone_deep did not create an independent subcopy!");
got = undefined;
expected = undefined;
fixture = undefined;

// gmst_json_decode
got = gmst_json_decode('{"a": "b"}');
assert_equal(got[? "a"], "b", "gmst_json_decode() failed!");
ds_map_destroy(got);
got = undefined;

// gmst_json_encode
fixture = ds_map_create();
fixture[? "alpha"] = "beta";
got = string_replace_all(gmst_json_encode(fixture), " ", "");
expected = '{"alpha":"beta"}';
assert_equal(got, expected, "gmst_json_encode() failed!");
got = undefined;
expected = undefined;
fixture = undefined;

// gmst_json_cleanup
fixture = ds_map_create();
gmst_json_cleanup(fixture);
assert_fail(ds_exists(fixture, ds_type_map));
fixture = undefined;

// gmst_output (partial test)
// String
assert_equal(gmst_output(TEXT_OUTPUT.STRING, "abc"), "abc", "gmst_out with string output failed!");
// File
assert_fail(file_exists(working_directory + "test.txt"), "False start on gmst_output file test!");
gmst_output(working_directory + "test.txt", "alpha beta gamma");
assert(file_exists(working_directory + "test.txt"), "gmst_out with file output failed!");
var f = file_text_open_read(working_directory + "test.txt");
got = file_text_read_string(f);
file_text_close(f);
file_delete(working_directory + "test.txt");
assert_equal(got, "alpha beta gamma", "gmst_out with file output is wrong!");
got = undefined;

