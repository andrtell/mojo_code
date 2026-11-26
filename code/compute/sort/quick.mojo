# Lomuto
def _part_v1[
    T: Movable,
    origin: MutOrigin,
    //,
    U: def(T, T) -> Bool,
](var a: Span[T, origin], lo: Int, hi: Int, less_than: U,) -> Int:
    var i = lo
    for j in range(lo, hi):
        if less_than(a[j], a[hi]):
            a.unsafe_swap_elements(i, j)
            i += 1
    a.unsafe_swap_elements(i, hi)
    return i


# Lomuto
def _sort_v1[
    T: Movable,
    origin: MutOrigin,
    //,
    U: def(T, T) -> Bool,
](var a: Span[T, origin], lo: Int, hi: Int, less_than: U,):
    if lo >= hi or lo < 0:
        return
    var p = _part_v1(a, lo, hi, less_than)
    _sort_v1(a, lo, p - 1, less_than)
    _sort_v1(a, p + 1, hi, less_than)


# Hoare
def _part_v2[
    T: Movable,
    origin: MutOrigin,
    //,
    U: def(T, T) -> Bool,
](var a: Span[T, origin], lo: Int, hi: Int, less_than: U,) -> Int:
    var pivot = lo
    var i = lo - 1
    var j = hi + 1

    while True:
        i += 1
        while less_than(a[i], a[pivot]):
            i += 1

        j -= 1
        while less_than(a[pivot], a[j]):
            j -= 1

        if pivot == i:
            pivot = j;

        if i >= j:
            return j

        a.unsafe_swap_elements(i, j)


# Hoare
def _sort_v2[
    T: Movable,
    origin: MutOrigin,
    //,
    U: def(T, T) -> Bool,
](var a: Span[T, origin], lo: Int, hi: Int, less_than: U,):
    if lo >= hi or lo < 0:
        return
    var p = _part_v2(a, lo, hi, less_than)
    _sort_v2(a, lo, p, less_than)
    _sort_v2(a, p + 1, hi, less_than)


def quick_sort[
    T: Movable,
    origin: MutOrigin,
    //,
    U: def(T, T) -> Bool,
](var a: Span[T, origin], less_than: U,):
    _sort_v2(a, 0, len(a) - 1, less_than)
