shared class Node(val, left = null, right = null) {
    shared Integer val;
    shared Node? left;
    shared Node? right;
}

shared void caminhamento_central(Node b) {
    if(exists next = b.left) {
        caminhamento_central(next);
    }
    process.write(b.val.string + " ");
    if(exists next = b.right) {
        caminhamento_central(next);
    }
}

shared void run() {

    Node arvore = Node {
        val = 1;
        left = Node {
            val = 2;
            left = Node {
                val = 4;
                left = Node { val = 8; };
                right = Node { val = 9; };
            };
            right = Node {
                val = 5;
                left = Node { val = 10; };
                right = Node { val = 11; };
            };
        };
        right = Node {
            val = 3;
            left = Node {
                val = 6;
                left = Node { val = 12; };
                right = Node { val = 13; };
            };
            right = Node {
                val = 7;
                left = Node { val = 17; };
                right = Node { val = 15; };
            };
        };
    };

    caminhamento_central(arvore);
    print("");
}
