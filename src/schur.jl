# https://en.wikipedia.org/wiki/Schur%27s_inequality
# https://www.mathraining.be/chapters/19/theories/74
function schur(α, β = 1)
    return ∑(a^α * (a^β - b^β) * (a^β - c^β))
end
