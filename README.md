# Graph BFS Algorithms

In this repo you will find Breadth First Search algorithms for graphs.  The first one is written in javascript and is based on a programming exercise that you can find [here](https://www.khanacademy.org/computing/computer-science/algorithms/breadth-first-search/p/challenge-implement-breadth-first-search).

+ A ruby version can be found in <tt>bfs_search.rb</tt>. 
+ There is also a Java solution: the code is viewable in <tt>bfs_search.java</tt> and the compiled files (VertexData.class, VertexList.class, and bfs_search.class) can be downloaded to run locally...provided you have Java 1.8 installed.

These examples take an [adjacency list](https://en.wikipedia.org/wiki/Adjacency_list) and then perform a breadth-first search across the graph starting from a given (source) position, finally returning a list of each vertex, its distance from the source, and its predecessor.

Below is an image depicting the graph that the algorithm performs a BFS on.

![Graph](/imgs/vertex_graph.png "Graph")

For Rubyists, there is also a file <tt>bfs_shortest_path.rb</tt> which will return the shortest path between any 
two vertices in the graph. The shortest path may not be unique, in which case it will return the first shortest path found. The logic for this can be found in the shortest_path method. At this time (3.22.16) there is no logic employed
in that method to deal with cases where there is no path between the starting and ending vertices.

Coming soon:

+ Augmentation to return the length of the shortest path
+ possible implementations in C# and Python.
