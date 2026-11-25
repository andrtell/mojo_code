from std.random import shuffle
from std.benchmark import Bench, Bencher, BenchId

from code.compute.sort import insertion_sort, selection_sort, bubble_sort


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
    try:
        var bench = std.benchmark.Bench()

        bench.bench_with_input(
            run_builtin_sort,
            std.benchmark.BenchId("builtin sort"),
            500,
        )

        bench.bench_with_input(
            run_insertion_sort,
            std.benchmark.BenchId("insertion sort"),
            500,
        )

        bench.bench_with_input(
            run_selection_sort,
            std.benchmark.BenchId("selection sort"),
            500,
        )

        bench.bench_with_input(
            run_bubble_sort,
            std.benchmark.BenchId("bubble sort"),
            500,
        )

        print(bench)
    except e:
        print(e)
