import java.io.*;
import java.lang.Thread;

class HelloKishalay {
    public static void main(String[] args) {
        try {
            System.out.println("Hello Kishalay Here");
            Thread.sleep(600000);
            System.out.println("Bye");
        }
        catch (Exception e) {
            System.out.println(e);
        }
    }
}
