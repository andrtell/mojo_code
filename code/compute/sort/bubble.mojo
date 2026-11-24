def bubble_sort[
    T: Movable,
    origin: MutOrigin,
    //,
](var a: Span[T, origin], less_than: def(T, T) thin -> Bool,):
    var n = len(a)
    while n > 1:
        var m = 0
        var j = 1
        while j < n:
            if less_than(a[j], a[j - 1]):
                a.unsafe_swap_elements(j, j - 1)
                m = j
            j += 1
        n = m
