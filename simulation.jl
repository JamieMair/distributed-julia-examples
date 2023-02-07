using Random

struct SimData{T}
    walk_length::Int
    sigma::T
    bias::T
    positions::Vector{T}
    area::T
end

function monte_carlo_sim(walk_length, sigma, bias)
    positions = zeros(Float64, walk_length)
    x = zero(eltype(positions))
    area = zero(eltype(positions))
    for t in 1:walk_length
        x += (randn()+bias)*sigma
        area += x
        positions[t] = x
    end

    return SimData(walk_length, sigma, bias, positions, area)
end