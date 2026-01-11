# Example 3.2 of SOS_Dumbass.pdf
using SOSChinese
lhs = 3 * (a^3 + b^3 + c^3 + a*b*c)
rhs = 4 * (a^2*b + b^2*c + c^2*a)
p = (lhs - rhs)
triangle(p)
# Comment trouver S_c ?
# En supposant que S_a, S_b et S_c sont des images cycliques les uns des autres, le a seule
# manière d'affecter le coefficient du terme abc est avec le coefficient de
# c dans S_c. On trouve donc que ce coefficient vaut -1/2.
# On multiplie p par 2 pour éviter d'avoir des fractions:
triangle(2p - cyclic_sum((a - b)^2 * (-c)))
# Si le coefficient devant a est x alors, après avoir retiré ∑_c (a - b)^2 * (x * a - c),
# on aura (6 - x) comme coefficient de b^3 et (-7 + 2x) comme coefficient de a^2b
# Comme les coefficients de b^3 et a^2b de ∑_c (a - b)^2 * b sont égaux et qu'il ne nous restera
# que le coefficient de b à trouver, on doit donc choisir x tels qu'ils sont égaux:
# 6 - x = -7 + 2x
# x = 13/3
# On multiplie par 3 pour éviter les fractions
triangle(6p - cyclic_sum((a - b)^2 * (13a - 3c)))
# On a maintenant le coefficient de c qui vaut 5
triangle(6p - cyclic_sum((a - b)^2 * (13a + 5b - 3c)))

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
