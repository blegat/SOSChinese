using DynamicPolynomials
include("dumbass.jl")
function schur_poly(t, x, y, z)
    return x^t * (x - y) * (x - z) +
           y^t * (y - z) * (y - x) +
           z^t * (z - x) * (z - y)
end
schur_poly(t, p::AbstractPolynomial) = schur_poly(t, variables(p)...)
function schur(t)
    @polyvar x y z
    dumbass(schur_poly(t, x, y, z))
end
