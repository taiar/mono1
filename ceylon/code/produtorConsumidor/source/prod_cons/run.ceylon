import java.lang {
	Thread
}
import java.util {
	Random
}

shared Integer getRandomInteger(Integer a, Integer b) {
	Random r = Random();
	value range = b - a + 1;
	value fraction = (range * r.nextDouble());
	return (fraction + a).integer;
}

shared void run() {
    
	value storage = Storage(10);
    
    value p1 = Producer(storage, 1);
    value c1 = Consumer(storage, 1);

    p1.start();
    c1.start();
}