# Example 3.1 of SOS_Dumbass.pdf
using SOSChinese
lhs = a^3 + b^3 + c^3 + 3a*b*c
rhs = a^2 * (b + c) + b^2 * (c + a) + c^2 * (a + b)
triangle(lhs - rhs)
lhs - rhs - schur(1)
p = 2 * (lhs - rhs)
triangle(p)
# Comment trouver S_c ?
# En supposant que S_a, S_b et S_c sont des images cycliques les uns des autres, le a seule
# manière d'affecter le coefficient du terme abc est avec le coefficient de
# c dans S_c. On trouve donc que ce coefficient vaut -1:
triangle(-cyclic_sum((a - b)^2 * c))
triangle(p - cyclic_sum((a - b)^2 * (-c)))
# Si le coefficient devant a est x alors, après avoir retiré ∑_c (a - b)^2 * (x * a - c),
# on aura (2 - x) comme coefficient de b^3 et (-1 + 2x) comme coefficient de a^2b
# Comme les coefficients de b^3 et a^2b de ∑_c (a - b)^2 * b sont égaux et qu'il ne nous restera
# que le coefficient de b à trouver, on doit donc choisir x tels qu'ils sont égaux:
# 2 - x = -1 + 2x
# 3 = 3x
# On trouve alors x = 1
triangle(p - cyclic_sum((a - b)^2 * (a - c)))
# Le coefficient pour b est maintenant 1:
triangle(p - cyclic_sum((a - b)^2 * (a + b - c)))
