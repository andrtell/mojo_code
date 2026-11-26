from std.testing import TestSuite, assert_equal
from std.random import shuffle

from code.compute.sort import quick_sort
from asserts import assert_sorted


comptime T = Int
comptime U = List[T]


@inline(.always)
def lt(a: T, b: T) -> Bool:
    return a < b


def test_quick_sort() raises:
    comptime f = quick_sort

    var got: U = []
    var want: U = []

    f(got, lt)
    assert_equal(got, want)

    got = [1]
    want = [1]
    f(got, lt)
    assert_equal(got, want)

    got = [7, 3]
    want = [3, 7]
    f(got, lt)
    assert_equal(got, want)

    got = [5, 4, 6, 5, 3, 1, 2, 2, 5]
    want = [1, 2, 2, 3, 4, 5, 5, 5, 6]
    f(got, lt)
    assert_equal(got, want)

    got = [n for n in range(100)]
    shuffle(got)
    f(got, lt)
    assert_sorted(got, lt)


def main() raises:
    TestSuite.discover_tests[__functions_in_module()]().run()
