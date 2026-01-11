# Example 2.1 of SOS_Dumbass.pdf
using SOSChinese
lhs = ((a + b + c) * (1/a + 1/b + 1/c) - 3) / 2
rhs = (a + b + c) * (a^2 + b^2 + c^2) / (a*b*c)
frac = lhs * lhs - rhs
d, r = divrem(frac.num, a * b * c)
p = convert(polynomial_type(a, Int), d)

triangle(2schur(1))
triangle(2schur(1) * a * b * c)

triangle(p - 2rotate(schur(1)))
pmean(p - 2rotate(schur(1)))

triangle(rotate(schur(1)))
triangle(p - 2rotate(schur(1)))
triangle(a * (b - c)^2)
triangle(a^2 * (b - c)^2)
triangle(cyclic_sum(a^3 * (b - c)^2))

p - cyclic_sum(a^4 * (b - c)^2) - 2rotate(schur(1))
