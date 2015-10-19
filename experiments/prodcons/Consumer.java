
class Consumer extends Thread {

   private CubbyHole cubbyhole;
   private int number;

   public Consumer(CubbyHole c, int number) {
      cubbyhole = c;
      this.number = number;
   }

   private void consume() {
      if(Math.random()  < 0.2) {
         System.out.println("[Consumer " + this.number + "] Feed me! I have to consume!");
         cubbyhole.get();
      } else {
         System.out.println("[Consumer " + this.number + "] I want nothing right now... Thank you!");
      }
   }
   
   public void run() {
      while(true) {
         this.consume();
         try {
           sleep((int)(Math.random() * 1000));
         }
         catch (InterruptedException e) { }
      }
   }
}
