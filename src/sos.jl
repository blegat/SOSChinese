using JuMP, PolyJuMP
import HiGHS

export sos, sym_sos

function sym_sos(p)
    d = maxdegree(p) - 2
    v = [a, b, c]
    model = Model(HiGHS.Optimizer)
    set_silent(model)
    @variable(model, S, Poly(monomials(v, d)))
    @constraint(model, Σ(S * (a - b)^2) == p)
    optimize!(model)
    if is_solved_and_feasible(model)
        return value(S)
    else
        return solution_summary(model)
    end
end

function sos(p)
    d = maxdegree(p) - 2
    v = [a, b, c]
    model = Model(HiGHS.Optimizer)
    set_silent(model)
    @variable(model, S[v], Poly(monomials(v, d)))
    @constraint(model, sum(S[v[i]] * (v[mod1(i + 1, 3)] - v[mod1(i + 2, 3)])^2 for i in 1:3) == p)
    optimize!(model)
    if is_solved_and_feasible(model)
        return value.(S)
    else
        return solution_summary(model)
    end
end
