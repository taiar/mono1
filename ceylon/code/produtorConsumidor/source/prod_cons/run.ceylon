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

"Run the module `prod_cons`."
shared void run() {
    
	value storage = Storage(10);
    
    storage.printMe();
    
    for(i in 0..20) {
        storage.add();
    }
    
    for(i in 0..20) {
        storage.get();
    }
}