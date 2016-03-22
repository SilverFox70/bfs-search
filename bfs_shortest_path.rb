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

class BFS_Vertex_Info
	attr_accessor :distance, :predecessor, :v_num

	def initialize(v_num, distance, predecessor)
		@v_num = v_num
		@distance = distance
		@predecessor = predecessor
	end

end



# Performs a breadth-first search on a graph
# graph is an adjacency list (array), source
# is the number of the origin vertex
def do_bfs(graph, source)
	bfs_info = []

	# Initialize all of our vertices to have nil values
	graph.each_with_index {|v, i| bfs_info[i] = BFS_Vertex_Info.new(i, nil, nil)}

	# Set our initial (starting) vertex to have a distance of 0
	# since it is the origin of our search
	bfs_info[source].distance = 0

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
				bfs_info[v].distance = bfs_info[vertex].distance + 1
				bfs_info[v].predecessor = vertex
				queue.enqueue(v)
			end
		end
	end

	# Return a list of vertices, their distances, and
	# predecessors
	bfs_info
end

# Note: this finds a shortest path, but that path may not
# be unique depending on the graph. There is no logic
# employed to deal with situations where there is no path
# between the start and end vertices.
def shortest_path(bfs_info, start, stop)
	current_vertex = bfs_info[stop]
	origin_vertex = bfs_info[start]
	path = []
	while current_vertex != origin_vertex
		path.push(current_vertex)
		if current_vertex.predecessor.nil?
			return path = nil
		else
			current_vertex = bfs_info[current_vertex.predecessor]	
		end
	end
	# Bring us to the origin itself
	path.push(current_vertex)
	path
end

# List must be in order of vertices!
adj_list = [[1], 
						[0, 4, 5],
						[3, 4, 5],
						[2, 6],
						[1, 2],
						[1, 2, 6],
						[3, 5],
						[]
					 ]

for i in 1..7
	bfs_info = do_bfs(adj_list, i);
	puts "=" * 30
	puts " BFS vertex 0 to vertex #{i}"
	bfs_info.each {|e| puts "vertex: #{e.v_num}  distance: #{e.distance}  predecessor: #{e.predecessor}"}
	puts "-" * 30
	puts " Shortest Path from vertex 0 to vertex #{i}"
	path = shortest_path(bfs_info, i, 0)
	if path.nil?
		puts "There is no path between these vertices"
	else
		path.each {|e| puts "vertex: #{e.v_num}  distance: #{e.distance}  predecessor: #{e.predecessor}"}
	end
end


