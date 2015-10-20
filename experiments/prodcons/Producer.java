import java.util.Random;

class Producer extends Thread {

  private Storage storage;
  private int number;

  public Producer(Storage c, int number) {
    storage = c;
    this.number = number;
  }

  private void produce() {
    if(Math.random() < 0.5) {
      System.out.println("[Producer " + this.number + "] Hey! I've produced!");
      storage.add();
    } else {
      System.out.println("[Producer " + this.number + "] I produced nothing... Sorry!");
    }
  }

  public void run() {
    while (true) {
      this.produce();
      try {
        sleep(ProducerConsumerTest.randInt(1, 5) * 1000);
      }
      catch (InterruptedException e) { }
    }
  }
}