import ceylon.collection { ArrayList }
import java.util.concurrent { Semaphore }
import java.lang { Thread, Math }

shared Integer getRandomInteger(Integer a = 1, Integer b = 5) {
	value range = b - a + 1;
	value fraction = (range * Math.random());
	value gen = (fraction + a).integer;
	print(gen);
	return gen;
}

class Producer(Storage storage, shared actual Integer id) extends Thread() {
	
	void produce() {
		if(Math.random() < 0.5) {
			storage.add(this);
		}
	}
	
	shared actual void run() {
		while(true) {
			this.produce();
			this.sleep(getRandomInteger(1, 4) * 1000);
		}
	}
	
}

class Consumer(Storage storage, shared actual Integer id) extends Thread() {
	
	void consume() {
		if(Math.random()  < 0.5) {
			storage.get(this);
		}
	}
	
	shared actual void run() {
		while(true) {
			this.consume();
			this.sleep(getRandomInteger(1, 4) * 1000);
		}
	}
	
}

class Storage(shared Integer storageSpaces) {
	
	value buffer = ArrayList<Integer>(storageSpaces);
	variable Integer lastEmpty = 0;
	value m = Semaphore(1);
	
	for(i in 0..(this.storageSpaces - 1)) {
		this.buffer.push(0);
	}
	
	shared void get(Producer|Consumer actor) {
		m.acquire();
		assert(actor is Consumer);
		print("[Consumer " + actor.id.string + "] Wants to consume!");
		if(this.lastEmpty == 0) {
			print("[Storage] I have nothing for you now. Look: ");
		} else {
			this.lastEmpty--;
			this.buffer.set(this.lastEmpty, 0);
			print("[Storage] Ok, I got a thing for you.");
		}
		m.release();
		this.printBuffer();
	}
	
	shared void add(Producer|Consumer actor) {
		m.acquire();
		assert(actor is Producer);
		print("[Producer " + actor.id.string + "] Produced something.");
		if(this.lastEmpty == this.storageSpaces) {
			print("[Storage] I'm full! Can't take it right now, look:");
		} else {
			this.buffer.set(this.lastEmpty, 1);
			this.lastEmpty++;
			print("[Storage] Tank you! I'll store it.");
		}
		m.release();
		this.printBuffer();
	}
	
	shared void printBuffer() {
		m.acquire();
		process.write("[ ");
		for (load in this.buffer) {
			process.write(load.string + " ");
		}
		print("]");
		m.release();
	}
	
}

shared void run() {
	value storage = Storage(15);
	
	value p1 = Producer(storage, 1);
	value p2 = Producer(storage, 2);

	value c1 = Consumer(storage, 1);
	value c2 = Consumer(storage, 2);

	p1.start();
	p2.start();

	c1.start();
	c2.start();
}