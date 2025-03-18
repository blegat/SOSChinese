module SOSChinese

using Reexport
@reexport using DynamicPolynomials
import MultivariatePolynomials as MP

export a, b, c
@polyvar a b c
include("triangle.jl")
include("cyclic.jl")
include("sos.jl")
include("schur.jl")

function check(p; n = 1000, pos = true, tol = 0)
    for _ in 1:n
        v = rand(3)
        if pos
            v = abs.(v)
        end
        val = p([a, b, c] => v)
        if val < -tol
            @warn("Value is $val < -$tol for $v")
        end
    end
end

# Taken from `JuMP/src/JuMP.jl`
const _EXCLUDE_SYMBOLS = [Symbol(@__MODULE__), :eval, :include]

for sym in names(@__MODULE__; all = true)
    sym_string = string(sym)
    if sym in _EXCLUDE_SYMBOLS ||
       startswith(sym_string, "_") ||
       startswith(sym_string, "@_")
        continue
    end
    if !(
        Base.isidentifier(sym) ||
        (startswith(sym_string, "@") && Base.isidentifier(sym_string[2:end]))
    )
        continue
    end
    @eval export $sym
end

end # module SOSChinese
