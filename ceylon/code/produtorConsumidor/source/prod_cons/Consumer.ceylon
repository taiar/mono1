import java.lang {
	Thread,
	Math
}

class Consumer(Storage storage, Integer id) extends Thread() {
	
	void consume() {
		if(Math.random()  < 0.5) {
			print("[Consumer " + this.id.string + "] I want to consume!");
			storage.get();
		} else {
			print("[Consumer " + this.id.string + "] I want nothing right now...");
		}
	}
	
	shared actual void run() {
		while(true) {
			this.consume();
			this.sleep(getRandomInteger(1, 4) * 1000);
		}
	}
	
}
