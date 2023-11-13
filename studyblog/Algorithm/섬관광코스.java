package day06;

//�˰��� 06 Tree 19p
public class �������ڽ� {
	
	class Node{
		String data; //������ A B C D E
		Node left, right;
		
		public Node(String data) {
			this.data=data;
			left=null;
			right=null;
		}
	}////////////////////////////
	
	public Node makeTree() {
		Node root=new Node("H"); //��Ʈ�� H
		
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
	
	//������ȸ
	public void pre(Node root) {
		if(root==null) {
			//System.out.println("����");
			return;
		}
		System.out.print(root.data+" -> ");
		pre(root.left);
		pre(root.right);
	}//----------------------------------
	
	
	//������ȸ
	public void center(Node root) {
		if(root==null) {
			//System.out.println("����");
			return;
		}
		center(root.left);
		System.out.print(root.data+" -> ");
		center(root.right);
	}//----------------------------------
	
	//������ȸ
	public void post(Node root) {
		if(root==null) {
			//System.out.println("����");
			return;
		}
		post(root.left);
		post(root.right);
		System.out.print(root.data+" -> ");
	}//----------------------------------
	
	
	
	public static void main(String[] args) {
		�������ڽ� app=new �������ڽ�();
		Node root=app.makeTree();
		
		System.out.println("-----������ȸ-----");
		app.pre(root);
		
		System.out.println("\n-----������ȸ-----");
		app.center(root);
		
		System.out.println("\n-----������ȸ-----");
		app.post(root);
		
	}//----------------------------------

}
