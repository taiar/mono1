// Import from Java SDK
import java.util { Random }

shared class Node(val, left = null, right = null) {
  shared Integer val;
  shared Node? left;
  shared Node? right;

  shared addNode(value) {
    if(value == null) {
      val = value;
    }
    elseif(val < value) {

    }
  }
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

// "shared" method, we'll see more later
shared Integer getRandomInteger(Integer a, Integer b, Random r) {
    value range = b - a + 1;
    value fraction = (range * r.nextDouble());
    return (fraction + a).integer; // cast from Float to Integer
}

shared void run() {
    Random random = Random();
    for(number in 1..100) { // here we use a Sequence, more on that later
        print(getRandomInteger(1, 100, random));
    }
}
