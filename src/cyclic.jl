export cyclic_sum, ∑
function cyclic_sum(p)
    return p + p(a => b, b => c, c => a) + p(a => c, b => a, c => b)
end
function sym_sum(p)
    return cyclic_sum(p) + cyclic_sum(p(a => c, b => b, c => a))
end
∑(p) = cyclic_sum(p)
function _lazy_div(a, d)
    if iszero(mod(a, d))
        div(a, d)
    else
        a // d
    end
end
function unsum(p, sum_func)
    if iszero(p)
        return zero(p)
    else
        t = leading_term(p)
        s = sum_func(monomial(t))
        α = MP.coefficient(s, monomial(t))
        r = _lazy_div(MP.coefficient(t), α)
        q = p - simplify_trivial_den(r * s)
        @assert nterms(q) < nterms(p)
        return t + unsum(q, sum_func)
    end
end
uncycle(p) = unsum(p, cyclic_sum)
unsym(p) = unsum(p, sym_sum)

function simplify_coefficients(p)
    return MP.mapcoefficients(p) do c
        if c isa AbstractFloat && round(Int, c) ≈ c
            return round(Int, c)
        elseif c isa Rational && isone(c.den)
            return c.num
        else
            return c
        end
    end
end
