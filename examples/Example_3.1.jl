# Example 3.1 of SOS_Dumbass.pdf
using SOSChinese
lhs = a^3 + b^3 + c^3 + 3a*b*c
rhs = a^2 * (b + c) + b^2 * (c + a) + c^2 * (a + b)
triangle(lhs - rhs)
