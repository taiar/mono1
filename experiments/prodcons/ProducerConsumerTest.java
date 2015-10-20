import java.util.Random;

public class ProducerConsumerTest {

   private static Random random = new Random();
   public static int randInt(int min, int max) {
      return random.nextInt((max - min) + 1) + min;
   }

   public static void main(String[] args) {
       Storage c = new Storage();

       Producer p1 = new Producer(c, 1);
       Producer p2 = new Producer(c, 2);
       Producer p3 = new Producer(c, 3);
       Consumer c1 = new Consumer(c, 1);
       Consumer c2 = new Consumer(c, 2);

       p1.start();
       p2.start();
       p3.start();
       c1.start();
       c2.start();
   }

}
