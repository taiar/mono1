
class Storage {

   final int STORAGE_SPACES = 15;

   private int contents;
   private boolean available = false;
   private int[] loads;
   private int lastEmpty;

   public Storage() {
      this.loads = new int[STORAGE_SPACES];
      for (int i = 0; i < STORAGE_SPACES; i++)
         loads[i] = 0;
      this.lastEmpty = 0;
   }

   public synchronized void get() {
      if(this.lastEmpty == 0) {
         System.out.println("[Storage] Hey Consumer, take it easy, man! I got nothing! Look: ");
      } else {
         this.lastEmpty -= 1;
         this.loads[lastEmpty] = 0;
         System.out.println("[Storage] Ok! I got something for you. Here you go.");
      }
      this.printMe();
   }

   public synchronized void add() {
      if(this.lastEmpty == STORAGE_SPACES) {
         System.out.println("[Storage] Hey Producer! I'm full! Can't take it right now, look:");
      } else {
         this.loads[lastEmpty] = 1;
         this.lastEmpty += 1;
         System.out.println("[Storage] Tank you! I'll store it for the Consumer.");
      }
      this.printMe();
   }

   private void printMe() {
      System.out.print("[ ");
      for (int i = 0; i < STORAGE_SPACES; i++) {
         System.out.print(this.loads[i] + " ");
      }
      System.out.print("]");
      System.out.println();
   }
}
