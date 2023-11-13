package day06;

//알고리즘 06 Tree 19p
public class 섬관광코스 {
	
	class Node{
		String data; //데이터 A B C D E
		Node left, right;
		
		public Node(String data) {
			this.data=data;
			left=null;
			right=null;
		}
	}////////////////////////////
	
	public Node makeTree() {
		Node root=new Node("H"); //루트가 H
		
		root.left=new Node("F");
		root.right=new Node("S");
		
		root.left.left=new Node("U");
		root.left.left.left=new Node("N");
		
		root.left.right=new Node("E");
		root.left.right.left=new Node("A");
		root.left.right.left.right=new Node("T");
		
		root.right.left=new Node("Z");
		
		root.right.right=new Node("K");
		root.right.right.right=new Node("Y");
		
		return root;
	}//----------------------------------
	
	//전위순회
	public void pre(Node root) {
		if(root==null) {
			//System.out.println("종료");
			return;
		}
		System.out.print(root.data+" -> ");
		pre(root.left);
		pre(root.right);
	}//----------------------------------
	
	
	//중위순회
	public void center(Node root) {
		if(root==null) {
			//System.out.println("종료");
			return;
		}
		center(root.left);
		System.out.print(root.data+" -> ");
		center(root.right);
	}//----------------------------------
	
	//후위순회
	public void post(Node root) {
		if(root==null) {
			//System.out.println("종료");
			return;
		}
		post(root.left);
		post(root.right);
		System.out.print(root.data+" -> ");
	}//----------------------------------
	
	
	
	public static void main(String[] args) {
		섬관광코스 app=new 섬관광코스();
		Node root=app.makeTree();
		
		System.out.println("-----전위순회-----");
		app.pre(root);
		
		System.out.println("\n-----중위순회-----");
		app.center(root);
		
		System.out.println("\n-----후위순회-----");
		app.post(root);
		
	}//----------------------------------

}
