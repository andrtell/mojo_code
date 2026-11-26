from std.random import shuffle
from std.benchmark import Bench, Bencher, BenchId

from code.compute.sort import (
    insertion_sort,
    selection_sort,
    bubble_sort,
    quick_sort,
)


@inline(.always)
def lt(a: Int, b: Int) -> Bool:
    return a < b


def run_builtin_sort(mut b: Bencher, size: Int):
    var state = [n for n in range(size)]
    b.iter_preproc(
        state,
        lambda (mut xs: List[Int]): sort(xs, lt),
        shuffle[T=Int],
    )


def run_insertion_sort(mut b: Bencher, size: Int):
    var state = [n for n in range(size)]
    b.iter_preproc(
        state,
        lambda (mut xs: List[Int]): insertion_sort(xs, lt),
        shuffle[T=Int],
    )


def run_quick_sort(mut b: Bencher, size: Int):
    var state = [n for n in range(size)]
    b.iter_preproc(
        state,
        lambda (mut xs: List[Int]): quick_sort(xs, lt),
        shuffle[T=Int],
    )


def run_selection_sort(mut b: Bencher, size: Int):
    var state = [n for n in range(size)]
    b.iter_preproc(
        state,
        lambda (mut xs: List[Int]): selection_sort(xs, lt),
        shuffle[T=Int],
    )


def run_bubble_sort(mut b: Bencher, size: Int):
    var state = [n for n in range(size)]
    b.iter_preproc(
        state,
        lambda (mut xs: List[Int]): bubble_sort(xs, lt),
        shuffle[T=Int],
    )


def main():
    comptime element_count = 1000

    try:
        var bench = std.benchmark.Bench()

        bench.bench_with_input(
            run_builtin_sort,
            std.benchmark.BenchId("builtin sort"),
            element_count,
        )

        bench.bench_with_input(
            run_quick_sort,
            std.benchmark.BenchId("quick sort"),
            element_count,
        )

        bench.bench_with_input(
            run_insertion_sort,
            std.benchmark.BenchId("insertion sort"),
            element_count,
        )

        bench.bench_with_input(
            run_selection_sort,
            std.benchmark.BenchId("selection sort"),
            element_count,
        )

        bench.bench_with_input(
            run_bubble_sort,
            std.benchmark.BenchId("bubble sort"),
            element_count,
        )

        print(bench)
    except e:
        print(e)
