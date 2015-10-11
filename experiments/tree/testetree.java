class Tree {
	public Tree left;
	public Tree right;
	public int value;

	public Tree(int val) {
		this.value = val;
	}
}

public class testetree {

	public static void caminhamento_central(Tree arvore) {
		if(arvore.left != null) caminhamento_central(arvore.left);
		System.out.print(arvore.value + " ");
		if(arvore.right != null) caminhamento_central(arvore.right);
	}

	public static void main(String x[]) {
		Tree arvore = new Tree(1);
		arvore.left = new Tree(2);
		arvore.left.left = new Tree(4);
		arvore.left.left.left = new Tree(8);
		arvore.left.left.right = new Tree(9);
		arvore.left.right = new Tree(5);
		arvore.left.right.left = new Tree(10);
		arvore.left.right.right = new Tree(11);

		arvore.right = new Tree(3);
		arvore.right.left = new Tree(6);
		arvore.right.left.left = new Tree(12);
		arvore.right.left.right = new Tree(13);
		arvore.right.right = new Tree(7);
		arvore.right.right.left = new Tree(14);
		arvore.right.right.right = new Tree(15);

		TreeUtil.caminhamento_central(arvore);
		System.out.println();
	}
}
