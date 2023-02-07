using MPI
MPI.Init()

comm = MPI.COMM_WORLD
comm_size = MPI.Comm_size(comm)
rank = MPI.Comm_rank(comm)

println("Hello world, I am $(rank) of $(comm_size)")
MPI.Barrier(comm)








