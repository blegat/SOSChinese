# Example 1.1 of SOS_Dumbass.pdf
using SOSChinese
triangle((a^2 + b^2 + c^2)^2)
lhs = 2 * (a^2 + b^2 + c^2)^2
triangle(lhs)
rhs = 3 * (a^3 * (b + c) + b^3 * (c + a) + c^3 * (a + b))
triangle(rhs)
p = lhs - rhs
triangle(p)
triangle(p - cyclic_sum(((a - b)^2 * (a^2 + b^2 - a * b))))
a^2 + b^2 - a * b = (a^2 + b^2 - 2a*b + a*b) = (a - b)^2 + a * b


triangle(p)














triangle(a^2 * (a - b)^2)
triangle(p - cyclic_sum((a^2 + b^2) * (a - b)^2))
triangle(p - cyclic_sum((a^2 + b^2 - a * b) * (a - b)^2))
