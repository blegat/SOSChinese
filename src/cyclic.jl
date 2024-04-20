export cyclic_sum, Σ
function cyclic_sum(p)
    return p + p(a => b, b => c, c => a) + p(a => c, b => a, c => b)
end
Σ(p) = cyclic_sum(p)
