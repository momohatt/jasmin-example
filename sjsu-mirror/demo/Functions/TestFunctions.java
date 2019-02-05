import java.util.*;

public class TestFunctions {
    public static void main(String[] args) {
        Scanner kbd = new Scanner(System.in);
        while(true) {
            System.out.print("-> ");
            long x = kbd.nextLong();
            x = Functions.abs(x);
            int y = Functions.fact((int)x);
            // alternatively
            // int y = RecursiveFunctions.fact((int)x);
            System.out.println("" + x + "! = " + y);

            System.out.print("quit?(y/n) ");
            String response = kbd.next();
            if (response.equals("y")) break;
        }
        System.out.println("bye");
    }


}
