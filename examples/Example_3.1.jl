# Example 3.1 of SOS_Dumbass.pdf
using DynamicPolynomials
include("dumbass.jl")
@polyvar a b c
lhs = a^3 + b^3 + c^3 + 3a*b*c
rhs = a^2 * (b + c) + b^2 * (c + a) + c^2 * (a + b)
dumbass(lhs - rhs)
