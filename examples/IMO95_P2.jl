# See MildorfInequality.pdf Example 10
using SOSChinese
frac = 1 / (a^3 * (b + c)) + 1 / (b^3 * (c + a)) + 1 / (c^3 * (a + b))
lhs = 2 * frac.num
rhs = 3 * frac.den
p = lhs - rhs
triangle(p)
