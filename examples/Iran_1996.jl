# Example 5.3 of SOS_Dumbass.pdf of Evan Chen
# Iran TST 1996
using SOSChinese

# Without ravi substitution
factor1 = cyclic_sum(a * b)
triangle(factor1)

triangle(cyclic_sum(factor1 * (b + a)^2 * (b + c)^2))

triangle(2schur(1) * a * b * c)
pmean(lhs - rhs - 2schur(1) * a * b * c)
pmean(schur(4))



factor2 = cyclic_sum((b + c)^2 * (a + b)^2)
lhs = 4factor1 * factor2
rhs = 9(a + b)^2 * (b + c)^2 * (c + a)^2

triangle(lhs)
triangle(rhs)
triangle(lhs - rhs)

pmean(lhs - rhs)










triangle(lhs)
triangle(rhs)
triangle(lhs - rhs)
triangle(cyclic_sum(a^5 * b))
triangle(lhs - rhs - 2schur(1) * a * b * c)

# With ravi substitution
# TODO
