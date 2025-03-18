# Example 1.1 of SOS_Dumbass.pdf
using SOSChinese
lhs = 2 * (a^2 + b^2 + c^2)^2
rhs = 3 * (a^3 * (b + c) + b^3 * (c + a) + c^3 * (a + b))
p = lhs - rhs
p
a^4 + b^4 + c^4 - a^3 * b - a * b^3 - a^3 * c - c^3 * a - b^3 * c - c^3 * b
triangle(p)
# Schur 3 + sum_c a * (a - b)^2 + sum_c a^3 - a^2b
