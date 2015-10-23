import java.lang {
	Math,
	Thread
}

import prod_cons { ... }

class Producer(Storage storage, Integer id) {
	
	void produce() {
		if(Math.random() < 0.5) {
			print("[Producer " + this.id.string + "] I produced!");
			storage.add();
		} else {
			print("[Producer " + this.id.string + "] I produced nothing...");			
		}
	}
	
	shared void run() {
		while(true) {
			this.produce();
			Thread.sleep(getRandomInteger(1, 4));
		}
	}
	
}