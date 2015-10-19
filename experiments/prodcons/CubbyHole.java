class CubbyHole {

   final int CUBBY_HOLE_SPACES = 15;

   private int contents;
   private boolean available = false;
   private int[] loads;
   private int lastEmpty;

   public CubbyHole() {
      this.loads = new int[CUBBY_HOLE_SPACES];
      for (int i = 0; i < CUBBY_HOLE_SPACES; i++) {
         loads[i] = 0;
      }
      this.lastEmpty = 0;
   }

   public synchronized void get() {
      if(this.lastEmpty == 0) {
         System.out.println("[Cubby Hole] Hey Consumer, take it easy, man! I got nothing! Look:");
         this.printMe();
      } else {
         this.lastEmpty -= 1;
         this.loads[lastEmpty] = 0;
         System.out.println("[Cubby Hole] Ok! I got something for you. Here you go.");
      }
      this.printMe();
   }

   public synchronized void add() {
      if(this.lastEmpty == CUBBY_HOLE_SPACES) {
         System.out.println("[Cubby Hole] Hey Producer! I'm full! Can't take it right now, look:");
      } else {
         this.loads[lastEmpty] = 1;
         this.lastEmpty += 1;
         System.out.println("[Cubby Hole] Tank you! I'll store it for the Consumer.");
      }

      this.printMe();
   }

   private void printMe() {
      System.out.print("[ ");
      for (int i = 0; i < CUBBY_HOLE_SPACES; i++) {
         System.out.print(this.loads[i] + " ");
      }
      System.out.print("]");
      System.out.println();
   }
}
