# Example 2.1 of SOS_Dumbass.pdf
using SOSChinese
lhs = ((a + b + c) * (1/a + 1/b + 1/c) - 3) / 2
rhs = (a + b + c) * (a^2 + b^2 + c^2) / (a*b*c)
frac = lhs * lhs - rhs
d, r = divrem(frac.num, a * b * c)
p = convert(polynomial_type(a, Int), d)
triangle(p)
# sum_c a^4 (b - c)^2 +
# schur 3 with ab, bc, ca
triangle(p - 2cyclic_sum(a * b * (a * b - b * c) * (a * b - a * c)))
triangle(a^3 * (b - c)^2)
