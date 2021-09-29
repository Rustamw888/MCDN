package MCDN;

import java.util.Random;

public class UserData {

    public static String incorrectPhoneNumber = "1111111111";
    public static String unRegisteredUserPhone = "9111111114";
    public static String correctPhoneNumber = generatePhoneNumber();
    public static String correctPhoneNumberCredit = generatePhoneNumber();
    public static String phoneForChangePassword = "9960180967";
    public static String incorrectMail = "Test@tt";
    public static String unregisteredEmail = "Test@tt.mm";
    public static String correctEmail = "a.s.san.17.8.939@yandex.ru";
    public static String newCorrectPassword = "Aa123456";
    public static String names = "Test";
    public static String nameRU = "Тест";
    public static String dateOfPasport = "01112014";
    public static String unCorrectDateOfPassport = "01112029";
    public static String passportNumber = "1454-564654";
    public static String birthDay = "12121990";
    public static String unCorrectBirthDay = "10102010";
    //public static String city = "Верхний Уфалей"; //Закоменченно из-за тесткейса 3. Ввод города полностью не отображает результат
    public static String city = "Верхний";
    public static String mainCity = "Москва";
    public static String commentText = "Текст для заполнения поля отзыва " + generateRandomInt();
    public static String classicPassword = "usertest1";

    private static int generateRandomInt() {
        double randomPhone = (int) (Math.random() * ((999999999 - 900000000) + 1) + 900000000);
        return (int) randomPhone;
    }

    private static String generatePhoneNumber() {
        return "9" + generateRandomInt();
    }

    public static String getFormatNumber(String phoneNumber) {
        return "7" + phoneNumber;
    }

    public static String getFormatNumberPhoneForChangePassword() {
        return "7" + phoneForChangePassword;
    }

    public static String getPhoneForRegistration() {
        return "7" + phoneForChangePassword;
    }

    public static String getRandomEmail() {
        return getSaltString() + "@unicom24.ru";
    }

    private static String getSaltString() {
        return getSaltString("abcdefghijklmnopqrstuvwxyz1234567890", 12);
    }

    private static String getSaltString(String saltChars, int len) {
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < len) { // length of the random string.
            int index = (int) (rnd.nextFloat() * saltChars.length());
            salt.append(saltChars.charAt(index));
        }
        return salt.toString();
    }
}
