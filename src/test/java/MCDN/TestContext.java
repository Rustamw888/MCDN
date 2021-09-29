package MCDN;

import io.restassured.http.Cookies;
import org.openqa.selenium.WebElement;

public class TestContext {

    public static String checkRedirectUrl;
    public static String smsCode;
    public static String smsServerValueUrl;
    public static WebElement btn;
    public static String emailServerLink;
    public static String passwordFromSms;
    public static String correctPhone;
    public static Integer messageBlockToGiveMoney;
    public static Integer reportsTabIsVisible;
    public static Integer countOfStart = 0;
    public static Integer NonMainTestUser = 0;
    public static String generatedEmail;
    public static Integer typeStepToReportsModalPage = 0; // используется в reportsModalPage для определения порядка действий при попытке получить отчет
    public static Integer clearMailCatcher = 0; // 0 - ловушку надо почистить в хуках
    public static Cookies cookies;
    public static String referralLinkForRegistration; // используется только в referral.feature для запоминания реф ссылки для регистрации дочернего аккаунта
    public static String loginType9ForOtherCases; // используется для передачи зареганного логи для учетки типа 9 в другие кейсы
    public static Integer bellCounter = 0; // счетчик уведомлений в ЛК партнера
    public static Integer blurElementIsDisplayed = 0; // 0 - всё норм, 1 - отключает проверку юникоинов в ЛК партнера в хедере
    public static String bufferString; // используется для хранения текста вместо буфера обмена
}
