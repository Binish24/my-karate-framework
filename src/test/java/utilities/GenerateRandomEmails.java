package utilities;

public class GenerateRandomEmails {

    // Create a method that is going to generate and return random emails.
    // dev122@tekschool.com --> Replace the 4xs with random numbers

    public static String generateRandomEmail() {
        int randomNumber = (int) (Math.random() * 100000);
        return "dev" + randomNumber + "@tekschool.com";
    }

//    public static void main(String[] args) {
//
//
//      //  System.out.println(generateRandomEmail());
//
//        for (int i = 1; i <+5; i ++) {
//            System.out.println( i + ": " +generateRandomEmail());
//        }
//
//
//    }
}
