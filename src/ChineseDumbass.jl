module ChineseDumbass

using Reexport
@reexport using DynamicPolynomials
import MultivariatePolynomials as MP

export a, b, c
@polyvar a b c
include("triangle.jl")
include("cyclic.jl")
include("sos.jl")

end # module ChineseDumbass
