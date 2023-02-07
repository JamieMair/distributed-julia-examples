using Distributed

addprocs(4, exeflags=["--project", "--threads=1"])

@everywhere include("simulation.jl")


using Base.Iterators: product
using BSON
walk_lengths = [100, 1000, 10000];
sigma_values = LinRange(0.1, 10.0, 1001);
biases = [0.0, 1.0, -1.0];
iter = collect(product(walk_lengths, sigma_values, biases));

results = pmap(args->monte_carlo_sim(args...), iter)

# Map reduce
average_area = @distributed (+) for args in iter
    abs_area = abs(monte_carlo_sim(args...).area)
    abs_area
end

BSON.@save "results.bson" results
