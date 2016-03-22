import java.util.*;

class VertexData {
	int distance;
	int predecessor;

	public VertexData(int dist,int pred){
		distance = dist;
		predecessor = pred;
	}

	public int getDistance(){
		return distance;
	}

	public int getPredecessor(){
		return predecessor;
	}

	public void setDistance(int dist){
		distance = dist;
	}

	public void setPredecessor(int pred){
		predecessor = pred;
	}
}

class VertexList {
	List<VertexData> vertexList = new ArrayList<>();

	public VertexList(int n){
		for (int i = 0; i < n; i++){
			vertexList.add(new VertexData(-1, -1));
		}
	}

	public String getVertexList(){
		String s = "";
		int count = 0;
		for (VertexData v: vertexList){
			s += "vertex: " + count + "\t distance: " + v.distance + "\t predecessor: " + v.predecessor + "\n";
			count ++;
		}
		return s;
	}
}

public class bfs_search {

	public static void main(String args[]){

		// Create our adjacency list
		int[][] adjacencyList = new int[][]{{1}, 
								    {0, 4, 5},
								    {3, 4, 5},
								    {2, 6},
								    {1, 2},
								    {1, 2, 6},
								    {3, 5},
								    {}
							 	   };					 	   
		DoBFS(adjacencyList, 3);
	}

	public static void DoBFS(int[][] graph, int source){
		// Set all vertices to -1 to show they have
		// not been visited.
		VertexList bfsInfo = new VertexList(graph.length);
		// Set our starting vertex to have a distance
		// of zero.
		bfsInfo.vertexList.get(source).distance = 0;
		// A queue for holding vertices
		Queue<Integer> queue = new LinkedList<Integer>();
		queue.add(source);

		// Traverse the graph
		while (!queue.isEmpty()){
			int vertex = queue.remove();
			System.out.println("current vertex: " + vertex + "\t distance: " + bfsInfo.vertexList.get(vertex).distance + "\t predecessor: " + bfsInfo.vertexList.get(vertex).predecessor + "\n");
			for (int i = 0; i < graph[vertex].length; i++){
				int nextVertex = graph[vertex][i];
				if (bfsInfo.vertexList.get(nextVertex).distance == -1){
					bfsInfo.vertexList.get(nextVertex).distance = bfsInfo.vertexList.get(vertex).distance + 1;
					bfsInfo.vertexList.get(nextVertex).predecessor = vertex;
					queue.add(nextVertex);
				}
			}
		}
		System.out.println(bfsInfo.getVertexList());
	}
}

