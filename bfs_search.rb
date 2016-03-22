# Create a Queue class with queue-like functionality
class Queue
	def initialize()
		@item = []
	end

	def enqueue(object)
		@item.push(object)
	end

	def dequeue()
		@item.shift()
	end

	def is_empty?
		@item.empty?
	end
end

# Note: it was a specific, albeit not very Ruby-like,
# choice to not use attr_accessor and instead create
# setter methods.
class BFS_Vertex_Info
	attr_accessor :distance, :predecessor

	def initialize(distance, predecessor)
		@distance = distance
		@predecessor = predecessor
	end

	def set_distance(d)
		@distance = d
	end

	def set_predecessor(obj)
		@predecessor = obj
	end
end

# Performs a breadth-first search on a graph
# graph is an adjacency list (array), source
# is the number of the origin vertex
def do_bfs(graph, source)
	bfs_info = []

	# Initialize all of our vertices to have nil values
	graph.each_with_index {|v, i| bfs_info[i] = BFS_Vertex_Info.new(nil, nil)}

	# Set our initial (starting) vertex to have a distance of 0
	# since it is the origin of our search
	bfs_info[source].set_distance(source)

	queue = Queue.new
	queue.enqueue(source)

	# Traverse the graph
	while !queue.is_empty?
		vertex = queue.dequeue();

		# Look at each vertex that is a neighbor of our 
		# current vertex; if its distance is nil, we
		# haven't visited it yet.
		graph[vertex].each do |v|
			if bfs_info[v].distance.nil?
				bfs_info[v].set_distance(bfs_info[vertex].distance + 1)
				bfs_info[v].set_predecessor(vertex)
				queue.enqueue(v)
			end
		end
	end

	# Return a list of vertices, their distances, and
	# predecessors
	bfs_info
end

adj_list = [[1], 
						[0, 4, 5],
						[3, 4, 5],
						[2, 6],
						[1, 2],
						[1, 2, 6],
						[3, 5],
						[]
					 ]

bfs_info = do_bfs(adj_list, 3);
bfs_info.each_with_index {|e, i| puts "vertex: #{i}  distance: #{e.distance}  predecessor: #{e.predecessor}"}

