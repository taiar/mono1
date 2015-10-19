import java.util.Random;

class Producer extends Thread {

  private CubbyHole cubbyhole;
  private int number;
  private static Random random = new Random();

  public static int randInt(int min, int max) {
      int randomNum = random.nextInt((max - min) + 1) + min;
      return randomNum;
  }

  public Producer(CubbyHole c, int number) {
    cubbyhole = c;
    this.number = number;
  }

  private void produce() {
    if(Math.random() < 8) {
      System.out.println("[Producer " + this.number + "] Hey! I've produced!");
      cubbyhole.add();
    } else {
      System.out.println("[Producer " + this.number + "] I produced nothing... Sorry!");
    }
  }

  public void run() {
    while (true) {
      this.produce();
      try {
        sleep(Producer.randInt(1, 5) * 100);
      }
      catch (InterruptedException e) { }
    }
  }
}