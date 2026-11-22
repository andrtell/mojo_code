def example_001():
    from std.time import sleep, perf_counter_ns

    var start = perf_counter_ns()
    sleep(0.01)
    var stop = perf_counter_ns()
    var elapsed = stop - start

    print(t"sleep() in {elapsed} ns\n")


def example_002():
    from std.time import sleep, perf_counter_ns
    from std.random import shuffle

    var input: List[Int] = [n for n in range(1000)]
    shuffle(input)
    var start = perf_counter_ns()
    sort(input)
    var stop = perf_counter_ns()
    var elapsed = stop - start

    print(t"sort() in {elapsed} ns\n")


def example_003():
    from std.time import sleep, perf_counter_ns
    from std.random import shuffle

    var input: List[Int] = [n for n in range(1000)]
    var num_iters = 100
    var elapsed = 0
    for _ in range(num_iters):
        shuffle(input)  # preproc(ess) each iteration
        var start = perf_counter_ns()
        sort(input)
        var stop = perf_counter_ns()
        elapsed += stop - start

    print(t"{num_iters} iterations of sort() in {elapsed} ns\n")


def example_004():
    from std.time import sleep, perf_counter_ns
    from std.random import shuffle

    def target_fn(mut input: List[Int]):
        sort(input)

    def preproc_iter(mut state: List[Int]):
        std.random.shuffle(state)

    var input: List[Int] = [n for n in range(1000)]
    var num_iters = 100
    var elapsed = 0
    for _ in range(num_iters):
        preproc_iter(input)
        var start = perf_counter_ns()
        target_fn(input)
        var stop = perf_counter_ns()
        elapsed += stop - start

    print(t"{num_iters} iterations of target_fn() in {elapsed} ns\n")


def example_005():
    from std.time import sleep, perf_counter_ns
    from std.random import shuffle
    from std.benchmark import Bencher

    def target_fn(mut state: List[Int]):  # benchmark this
        sort(state)

    def preproc_iter(mut state: List[Int]):  # pre-proc(ess) each iteration
        shuffle(state)

    var state: List[Int] = [n for n in range(1000)]
    var bencher = Bencher(num_iters=100)
    bencher.iter_preproc(state, target_fn, preproc_iter)

    print(t"Bencher: target_fn() in {bencher.elapsed} ns\n")


def example_006():
    from std.benchmark import Bench, Bencher

    def target_fn(mut state: List[Int]):
        sort(state)

    def preproc_iter(mut state: List[Int]):
        std.random.shuffle(state)

    def bench_runner(mut bencher: std.benchmark.Bencher, input: List[Int]):
        var state = input.copy()
        bencher.iter_preproc(state, target_fn, preproc_iter)

    var input: List[Int] = [n for n in range(1000)]
    try:
        var bench = std.benchmark.Bench()

        bench.bench_with_input(
            bench_runner,
            std.benchmark.BenchId("run 1"),
            input,
        )

        bench.bench_with_input(
            bench_runner,
            std.benchmark.BenchId("run 2"),
            input,
        )
        print(bench)
    except e:
        print(e)


def main():
    print(t"001:\n")
    example_001()

    print(t"002:\n")
    example_002()

    print(t"003:\n")
    example_003()

    print(t"004:\n")
    example_004()

    print(t"005:\n")
    example_005()

    print(t"006:\n")
    example_006()
