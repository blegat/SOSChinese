# Example 2.1 of SOS_Dumbass.pdf
using DynamicPolynomials
include("dumbass.jl")
@polyvar a b c
lhs = ((a + b + c) * (1/a + 1/b + 1/c) - 3) / 2
rhs = (a + b + c) * (a^2 + b^2 + c^2) / (a*b*c)
frac = lhs * lhs - rhs
d, r = divrem(frac.num, a * b * c)
p = convert(polynomial_type(a, Int), d)
dumbass(p)
# sum_c a^4 (b - c)^2 +
# schur 3 with ab, bc, ca
dumbass(p - 2cyclic_sum(a * b * (a * b - b * c) * (a * b - a * c)))
dumbass(a^3 * (b - c)^2)
