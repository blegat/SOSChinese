export cyclic_sum, ∑
function rotate(p)
    return p(a => b * c, b => c * a, c => a * b)
end
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
        q = p - simplify_coefficients(r * s)
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

struct PMean{T}
    coefficient::T
    exps::NTuple{3,Int}
end

function pmean(t::MP.AbstractTerm)
    coef = abs(MP.coefficient(t))
    ea, eb, ec = sort(MP.exponents(t), rev = true)
    num_diff = length(Set([ea, eb, ec]))
    if num_diff == 2
        coef *= 3
    elseif num_diff == 3
        coef *= 6
    end
    return PMean(coef, (ea, eb, ec))
end

function Base.show(io::IO, p::PMean)
    print(io, p.coefficient, "[", p.exps, "]")
end

function _pmean(p, op)
    first = true
    for t in MP.terms(p)
        coef = MP.coefficient(t)
        if op(coef) > 0
            pm = pmean(t)
            if first
                first = false
            else
                print(" + ")
            end
            print(pm)
        end
    end
end

function pmean(p::MP.AbstractPolynomialLike)
    s = unsym(p)
    _pmean(s, +)
    print(" ≥ ")
    _pmean(s, -)
    println()
    return
end
