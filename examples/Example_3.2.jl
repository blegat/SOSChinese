# Example 3.2 of SOS_Dumbass.pdf
using SOSChinese
lhs = 3 * (a^3 + b^3 + c^3 + a*b*c)
rhs = 4 * (a^2*b + b^2*c + c^2*a)
p = lhs - rhs
triangle(p)
# Schur 3 + sum_c a * (a - b)^2 + sum_c a^3 - a^2b

# Automated:
p = 3(cyclic_sum(a^3) + a * b * c) - 4cyclic_sum(a^2 * b)
triangle(p)
S = 6 * cyclic_sos(p)
Sc = -3c + 5b + 13a
Sa = Sc(a => b, b => c, c => a)
Sb = Sc(a => c, b => a, c => b)

# Idea of student in April 2024
# First symmetrize
triangle(3p - 4cyclic_sum(a * (a - b)^2))
# Then Schur
triangle(3p - 4cyclic_sum(a * (a - b)^2) - 4schur(1))
# Then AM-GM
