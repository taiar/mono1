abstract class Node() {
    shared formal void accept(Visitor v);
}

class Leaf(shared Object element) 
        extends Node() {
    accept(Visitor v) => v.visitLeaf(this);
}

class Branch(shared Node left, shared Node right) 
        extends Node() {
    accept(Visitor v) => v.visitBranch(this);
}

interface Visitor {
    shared formal void visitLeaf(Leaf l);
    shared formal void visitBranch(Branch b);
}

void printTree(Node node) {
    object printVisitor satisfies Visitor {
        shared actual void visitLeaf(Leaf leaf) {
            print("Found a leaf: ``leaf.element``!");
        }
        shared actual void visitBranch(Branch branch) {
            branch.left.accept(this);
            branch.right.accept(this);
        }
    }
    node.accept(printVisitor);
}