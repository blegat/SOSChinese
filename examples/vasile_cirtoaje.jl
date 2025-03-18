# Problem .41 of Mildorf_2006_Olympiad Inequalities.pdf
# https://www.isinj.com/mt-usamo/Olympiad%20Inequalities%20-%20Thomas%20Mildorf%20(2006).pdf
# Done on 15/03/2025

using SOSChinese
f(a, b) = 4a^2 - a * b + 4b^2

A = f(b, c)
B = f(c, a)
C = f(a, b)
S2 = a^2 + b^2 + c^2

p = 7S2 * (A * B + B * C + C * A) - 9A * B * C

I2 = ∑(a * b * (a - b)^4)
I3 = (a - b)^2 * (b - c)^2 * (c - a)^2
triangle(p)
triangle(p - 112schur(4))
triangle(p - 112schur(4) - 84I2)
triangle(p - 112schur(4) - 84I2 - 208I3)
q = div_multiple(p - 112schur(4) - 84I2 - 208I3, a * b * c)
triangle(q)
triangle(q - 399schur(1))
# AM-GM
AMGM = sym_sum(a^2 * b) - 6a * b * c
triangle(q - 399schur(1) - 14AMGM)
