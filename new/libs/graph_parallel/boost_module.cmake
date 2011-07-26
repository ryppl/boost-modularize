# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Graph Parallel"
  AUTHORS
    "Douglas Gregor <doug.gregor -at- gmail.com>"
    "Nicholas Edmonds <ngedmond -at- osl.iu.edu>"
    "Jeremiah Willcock <jewillco -at- osl.iu.edu>"
    "Andrew Lumsdaine"
  DESCRIPTION
    "Parallel support using MPI for Boost.Graph."
  DEPENDS
    mpi
    graph
  )
