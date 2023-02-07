using Distributed
using ClusterManagers

addprocs(SlurmManager(4), exeflags=["--project", "--threads=2"])

@everywhere function get_info()
    results = Dict{Symbol, Any}()
    results[:num_threads] = Threads.nthreads()
    results[:id] = myid()
    results[:hostname] = gethostname()
    return results
end

info = []
for i in workers()
    worker_info = fetch(@spawnat i get_info())
    push!(info, worker_info)
end

println(info)