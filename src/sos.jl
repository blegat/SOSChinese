using JuMP, PolyJuMP
import HiGHS

export sos, cyclic_sos

function cyclic_sos(p)
    d = maxdegree(p) - 2
    v = [a, b, c]
    model = Model(HiGHS.Optimizer)
    set_silent(model)
    @variable(model, S, Poly(monomials(v, d)))
    @constraint(model, cyclic_sum(S * (a - b)^2) == p)
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

function constant_combine(pos, neg)
    model = Model(HiGHS.Optimizer)
    set_silent(model)
    @variable(model, α[eachindex(pos)] >= 0)
    @variable(model, β[eachindex(neg)] <= 0)
    @constraint(model, α' * pos + β' * neg == 0)
    @constraint(model, sum(α) + sum(β) == 1)
    optimize!(model)
    if is_solved_and_feasible(model)
        return value.(α), value.(β)
    else
        return solution_summary(model)
    end
end
