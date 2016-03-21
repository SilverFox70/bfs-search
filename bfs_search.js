/* A Queue object for queue-like functionality over JavaScript arrays. */
var Queue = function() {
    this.items = [];
};
Queue.prototype.enqueue = function(obj) {
    this.items.push(obj);
};
Queue.prototype.dequeue = function() {
    return this.items.shift();
};
Queue.prototype.isEmpty = function() {
    return this.items.length === 0;
};

/*
 * Performs a breadth-first search on a graph
 * @param {array} graph - Graph, represented as adjacency lists.
 * @param {number} source - The index of the source vertex.
 * @returns {array} Array of objects describing each vertex, like
 *     [{distance: _, predecessor: _ }]
 */
var doBFS = function(graph, source) {
    var bfsInfo = [];

    // Initialize the bfsInfo for all vertex to be null to start
    for (var i = 0; i < graph.length; i++) {
	    bfsInfo[i] = {
	        distance: null,
	        predecessor: null };
    }

    // Set our initial (starting) vertex to have a distance of zero
    // since it is the origin of our search
    bfsInfo[source].distance = 0;

    var queue = new Queue();
    queue.enqueue(source);

    // Traverse the graph
    // While our queue is not empty:
    while (!queue.isEmpty()){
        // Remove a vertex from the queue; remember queues are first in
        // first out. 
        var vertex = queue.dequeue();
        
        // graph[vertex].length returns the length of the array of adjacent
        // vertices from the adjacency list. If we were to use an adjacency
        // matrix or edge list, we would need to adjust our code.
        for (var i = 0; i < graph[vertex].length; i++){
            var nextVertex = graph[vertex][i];
            
            // If the nextVertex's distance is null, then it has not been 
            // visited.  In this case, set its distance to one greater than
            // the vertex's distance from which we are looking and also set
            // its predecessor to be that vertex. Then add the nextVertex to
            // the queue.
            if (bfsInfo[nextVertex].distance === null){
                bfsInfo[nextVertex].distance = bfsInfo[vertex].distance + 1;
                bfsInfo[nextVertex].predecessor = vertex;
                queue.enqueue(nextVertex);
            }
        }
    }

    // Returns a list of vertices, their distance, and who their predecessor is
    return bfsInfo;
};


var adjList = [
    [1],
    [0, 4, 5],
    [3, 4, 5],
    [2, 6],
    [1, 2],
    [1, 2, 6],
    [3, 5],
    []
    ];
var bfsInfo = doBFS(adjList, 3);
for (var i = 0; i < adjList.length; i++) {
    console.log("vertex " + i + ": distance = " + bfsInfo[i].distance + ", predecessor = " + bfsInfo[i].predecessor);
}
