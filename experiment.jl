using Base.Iterators: product
using BSON
include("simulation.jl")
walk_lengths = [100, 1000, 10000];
sigma_values = LinRange(0.1, 10.0, 1001);
biases = [0.0, 1.0, -1.0];
iter = collect(product(walk_lengths, sigma_values, biases));
results = map(args->monte_carlo_sim(args...), iter)

average_area = mapreduce(args->abs(monte_carlo_sim(args...).area), +, iter)/length(iter)

BSON.@save "results.bson" results

# LOADING:
# results = nothing
# BSON.@load "results.bson" results