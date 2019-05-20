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

// MctsConfigs
expected = GmstArray(11, undefined, 22, undefined, 33, undefined, 44, undefined, 55, undefined, 66, undefined, true);
got = MctsConfigs(11, 22, 33, 44, 55, 66, true);
assert_equal(got, expected, "MctsConfigs constructor failed on simple case!");
expected = GmstArray(111, "a", 222, "b", 333, "c", 444, "d", 555, "e", 666, "f", false);
got = MctsConfigs(
  GmstArray(111, "a"),
  GmstArray(222, "b"),
  GmstArray(333, "c"),
  GmstArray(444, "d"),
  GmstArray(555, "e"),
  GmstArray(666, "f"),
  false
);
assert_equal(got, expected, "MctsConfigs constructor failed on extended case!");
expected = GmstArray(111, "a", 222, undefined, 333, "c", 444, "d", 555, undefined, 666, "f", false);
got = MctsConfigs(
  GmstArray(111, "a"),
  222,
  GmstArray(333, "c"),
  GmstArray(444, "d"),
  555,
  GmstArray(666, "f"),
  false
);
assert_equal(got, expected, "MctsConfigs constructor failed on mixed case!");
got = undefined;
expected = undefined;

// MctsNode
expected = GmstArray(1, 4, 3, 6, 2, undefined, "memo", 5);
got = MctsNode(1, 4, 3, 6, 2, undefined, "memo", 5);
assert_equal(got, expected, "MctsNode constructor failed!");
got = undefined;
expected = undefined;

// RawMctsTree
expected = GmstArray(
  MctsNode(1, 4, 3, 6, 2, undefined, "memo", 5),
  undefined,
  Ruleset(0, 11, 22, 33, 44, 55, 66, 77, 88, 99),
  MctsConfigs(11, 22, 33, 44, 55, 66, true)
);
got = RawMctsTree(
  MctsNode(1, 4, 3, 6, 2, undefined, "memo", 5),
  undefined,
  Ruleset(0, 11, 22, 33, 44, 55, 66, 77, 88, 99),
  MctsConfigs(11, 22, 33, 44, 55, 66, true)
);
assert_equal(got, expected, "RawMctsTree constructor failed!");
expected = undefined;

// MctsTree with node state mode on
expected = RawMctsTree(
  MctsNode(undefined, undefined, 0, 0, 0, undefined, "state", undefined),
  undefined,
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, 44, 55, 66, 77),
  MctsConfigs(111, 222, 333, 444, 555, 666, true)
);
got = MctsTree(
  "state",
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, 44, 55, 66, 77),
  MctsConfigs(111, 222, 333, 444, 555, 666, true)
);
assert_equal(got, expected, "MctsTree constructor failed with node state mode on!");
// MctsTree with node state mode off
expected = RawMctsTree(
  MctsNode(undefined, undefined, 0, 0, 0, undefined, undefined, undefined),
  "state",
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, 44, 55, 66, 77),
  MctsConfigs(111, 222, 333, 444, 555, 666, false)
);
got = MctsTree(
  "state",
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, 44, 55, 66, 77),
  MctsConfigs(111, 222, 333, 444, 555, 666, false)
);
assert_equal(got, expected, "MctsTree constructor failed with node state mode off!");
got = undefined;
expected = undefined;

// MmConfigs
expected = GmstArray(11, undefined, 22, undefined, 33, undefined, undefined, undefined, true);
got = MmConfigs(11, 22, 33, undefined, true);
assert_equal(got, expected, "MmConfigs constructor failed with simple case!");
expected = GmstArray(111, "a", 222, "b", 333, "c", 444, "d", false);
got = MmConfigs(
  GmstArray(111, "a"),
  GmstArray(222, "b"),
  GmstArray(333, "c"),
  GmstArray(444, "d"),
  false
);
assert_equal(got, expected, "MmConfigs constructor failed with extended case!");
expected = GmstArray(111, "a", 222, undefined, 333, undefined, 444, "d", true);
got = MmConfigs(
  GmstArray(111, "a"),
  222,
  333,
  GmstArray(444, "d"),
  true
);
assert_equal(got, expected, "MmConfigs constructor failed with mixed case!");
got = undefined;
expected = undefined;

// MmNode
expected = GmstArray(1, -1, 32, undefined, "memo", undefined);
got = MmNode(1, -1, 32, undefined, "memo", undefined);
assert_equal(got, expected, "MmNode constructor failed!");
got = undefined;
expected = undefined;

// RawMmTree
expected = GmstArray(
  MmNode(1, -1, 32, undefined, "memo", undefined),
  undefined,
  Ruleset(0, 11, 22, 33, 44, 55, 66, 77, 88, 99),
  MmConfigs(11, 22, 33, undefined, true)
);
got = RawMmTree(
  MmNode(1, -1, 32, undefined, "memo", undefined),
  undefined,
  Ruleset(0, 11, 22, 33, 44, 55, 66, 77, 88, 99),
  MmConfigs(11, 22, 33, undefined, true)
);
assert_equal(got, expected, "RawMmTree constructor failed!");
got = undefined;
expected = undefined;

// MmTree with node state mode on
expected = RawMmTree(
  MmNode(undefined, 583, undefined, undefined, 583, undefined),
  undefined,
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, gmst_identity, 55, 66, 77),
  MmConfigs(gmst_identity, 111, 222, 333, true)
);
got = MmTree(
  583,
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, gmst_identity, 55, 66, 77),
  MmConfigs(gmst_identity, 111, 222, 333, true)
);
assert_equal(got, expected, "MmTree constructor failed with node state mode on!");
// MmTree with node state mode off
expected = RawMmTree(
  MmNode(undefined, 583, undefined, undefined, undefined, undefined),
  583,
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, gmst_identity, 55, 66, 77),
  MmConfigs(gmst_identity, 111, 222, 333, false)
);
got = MmTree(
  583,
  Ruleset(gmst_identity, gmst_identity, undefined, 11, 22, 33, gmst_identity, 55, 66, 77),
  MmConfigs(gmst_identity, 111, 222, 333, false)
);
assert_equal(got, expected, "MmTree constructor failed with node state mode off!");
got = undefined;
expected = undefined;

