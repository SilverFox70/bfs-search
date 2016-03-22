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
		for (VertexData v: vertexList){
			s += "distance: " + v.distance + "\t predecessor: " + v.predecessor + "\n";
		}
		return s;
	}
}

public class bfs_search {

	public static void main(String args[]){
		// A queue for holding vertices
		Queue queue = new LinkedList();
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
			System.out.println("Source: " + source);
			VertexList bfsInfo = new VertexList(graph.length);
			System.out.println(bfsInfo.getVertexList());
		}
}

