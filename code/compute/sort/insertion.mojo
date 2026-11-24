def insertion_sort[
    T: Movable,
    origin: MutOrigin,
    //,
](var a: Span[T, origin], less_than: def(T, T) thin -> Bool,):
    var i = 1
    while i < len(a):
        var j = i
        while j > 0 and less_than(a[j], a[j - 1]):
            a.unsafe_swap_elements(j, j - 1)
            j -= 1
        i += 1
