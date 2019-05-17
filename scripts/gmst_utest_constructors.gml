///gmst_utest_constructors()
var expected, got, fixture;

// Ruleset
expected = GmstArray(0, 11, 22, 33, 44, 55, 66, 77, 88, 99);
got = Ruleset(0, 11, 22, 33, 44, 55, 66, 77, 88, 99);
assert_equal(got, expected, "Ruleset constructor failed!");
got = undefined;
expected = undefined;

// TextGameset
expected = GmstArray(0, 111, 222, 333, 444, 555, 666);
got = TextGameset(0, 111, 222, 333, 444, 555, 666);
assert_equal(got, expected, "TextGameset constructor failed!");
got = undefined;
expected = undefined;

