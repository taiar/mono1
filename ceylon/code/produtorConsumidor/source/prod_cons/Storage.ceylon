import ceylon.collection {
	ArrayList
}
import java.util.concurrent {
	Semaphore
}

class Storage(shared Integer storageSpaces) {
	
	// class members
	value loads = ArrayList<Integer>(storageSpaces);
	variable Integer lastEmpty = 0;
	value m = Semaphore(1);
	
	for(i in 0..(this.storageSpaces - 1)) {
		this.loads.push(0);
	}
	
	shared void get() {
		m.acquire();
		if(this.lastEmpty == 0) {
			print("[Storage] I have nothing for you now. Look: ");
		} else {
			this.lastEmpty--;
			this.loads.set(this.lastEmpty, 0);
			print("[Storage] Ok, I got a thing for you.");
		}
		this.printMe();
		m.release();
	}
	
	shared void add() {
		m.acquire();
		if(this.lastEmpty == this.storageSpaces) {
			print("[Storage] I'm full! Can't take it right now, look:");
		} else {
			this.loads.set(this.lastEmpty, 1);
			this.lastEmpty++;
			print("[Storage] Tank you! I'll store it.");
		}
		this.printMe();
		m.release();
	}
	
	shared void printMe() {
		process.write("[ ");
		for (load in this.loads) {
			process.write(load.string + " ");
		}
		print("]");
	}
		
}