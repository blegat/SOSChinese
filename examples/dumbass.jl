function triangle(rows)
    max_num_len = maximum(map(row -> maximum(length.(row)), rows))
    if iseven(max_num_len)
        max_num_len += 1
    end
    function pad(s)
        x = div(max_num_len - length(s), 2)
        y = max_num_len - x - length(s)
        return " "^x * s * " "^y
    end
    map!(row -> map!(pad, row, row), rows, rows)
    lines = [join(row, " ") for row in rows]
    max_len = maximum(length.(lines))
    for line in lines
        print(" "^div(max_len - length(line), 2))
        println(line)
    end
end
function dumbass(d::Int)
    @polyvar a b c
    rows = [
        [string(a^i * b^j * c^(d - i - j)) for j in (d - i):-1:0]
        for i in d:-1:0
    ]
    triangle(rows)
end
function dumbass(p, a, b, c)
    d = maxdegree(p)
    rows = [
        [string(coefficient(p, a^i * b^j * c^(d - i - j))) for j in (d - i):-1:0]
        for i in d:-1:0
    ]
    triangle(rows)
end
dumbass(p) = dumbass(p, variables(p)...)
function cyclic_sum(p)
    vars = variables(p)
    s = zero(p)
    for i in 1:length(vars)
        v = vcat(vars[i:end], vars[1:(i-1)])
        s += p(vars => v)
    end
    return s
end
