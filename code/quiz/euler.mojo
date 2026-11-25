from std.testing import TestSuite, assert_equal


#
# PROJECT EULER / PROBLEM 1
# ---
#
# If we list all the natural numbers below that are multiples of 3
# or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#


#
# Solution 1: O(n)
#
def ep1_1(n: Int) -> Int:
    var sum = 0
    for i in range(1, n):
        if i % 3 == 0 or i % 5 == 0:
            sum += i
    return sum


#
# Solution 2: O(1)
#
def ep1_2(var n: Int) -> Int:
    #  1 + 2  + 3  + ... + n  = n(n + 1)/2
    def sum(var n: Int) -> Int:
        return n * (n + 1) // 2

    n -= 1

    #  k + 2k + 3k + ... + nk = k * (1 + 2 + 3 ... + n)
    return 3 * sum(n // 3) + 5 * sum(n // 5) - 3 * 5 * sum(n // (3 * 5))


def test_ep1() raises:
    assert_equal(ep1_1(10), 23)
    assert_equal(ep1_2(10), 23)

    var want = 0
    for n in range(1000):
        if n % 3 == 0 or n % 5 == 0:
            want += n
        assert_equal(ep1_2(n + 1), want)

    assert_equal(ep1_1(1000), ep1_2(1000))


def main() raises:
    TestSuite.discover_tests[__functions_in_module()]().run()
