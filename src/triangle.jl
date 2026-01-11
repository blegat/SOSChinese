export triangle
function triangle(rows::Vector)
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
function triangle(d::Int)
    rows = [
        [sprint(show, a^i * b^j * c^(d - i - j)) for j in (d - i):-1:0]
        for i in d:-1:0
    ]
    triangle(rows)
end
triangle(t::MP.AbstractTermLike) = triangle(MP.polynomial(t))
function triangle(p::MP.AbstractPolynomial)
    d = maxdegree(p)
    if d != mindegree(p)
        error("$p is not homogeneous, it has mindegree $(mindegree(p)) and maxdegree $d")
    end
    rows = [
        [string(MP.coefficient(p, a^i * b^j * c^(d - i - j))) for j in (d - i):-1:0]
        for i in d:-1:0
    ]
    triangle(rows)
end
