import java.lang {
	Math,
	Thread
}

import prod_cons { ... }
import java.util.concurrent {
	Semaphore
}

class Producer(Storage storage, Integer id) extends Thread() {
	
	void produce() {
		if(Math.random() < 0.5) {
			print("[Producer " + this.id.string + "] I produced!");
			storage.add();
		} else {
			print("[Producer " + this.id.string + "] I produced nothing...");			
		}
	}
	
	// actual define o método que está sobrescrevendo (olhar melhor o modelo de herança)
	shared actual void run() {
		while(true) {
			this.produce();
			this.sleep(getRandomInteger(1, 4) * 1000);
		}
	}
	
}