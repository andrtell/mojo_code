def selection_sort[
    T: Movable,
    origin: MutOrigin,
    //,
](var a: Span[T, origin], less_than: def(T, T) thin -> Bool,):
    var i = 0
    while i < len(a) - 1:
        var m = i
        var j = i + 1
        while j < len(a):
            if less_than(a[j], a[m]):
                m = j
            j += 1
        if i != m:
            a.unsafe_swap_elements(i, m)
        i += 1
