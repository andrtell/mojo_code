from std.testing import assert_true


def assert_sorted[
    T: AnyType,
    origin: ImmOrigin,
    //,
    U: def(T, T) -> Bool,
](span: Span[T, origin], less_than: U) raises:
    for i in range(1, len(span)):
        assert_true(
            less_than(span[i - 1], span[i]), String("error at index: ", i)
        )
