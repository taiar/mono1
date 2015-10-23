import java.lang {
	Thread,
	Math
}

class Consumer(Storage storage, Integer id) {
	
	void consume() {
		if(Math.random()  < 0.5) {
			print("[Consumer " + this.id.string + "] I want to consume!");
			storage.get();
		} else {
			print("[Consumer " + this.id.string + "] I want nothing right now...");
		}
	}
	
	shared void run() {
		while(true) {
			this.consume();
			Thread.sleep(getRandomInteger(1, 4));
		}
	}
	
}
