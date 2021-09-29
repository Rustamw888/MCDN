package MCDN;

public class PagesUrls {

    public static String base = System.getenv("TESTING_HOST");
//    public static String base = "release-01.vuaro.ru"; //b2c
//    public static String base = "release-02.vuaro.ru"; //b2b
//    public static String base = "develop-46.vuaro.ru";
//    public static String base = "unicom24.ru";
    public static String mainPage = baseUrl();
    public static String bankListPage = bankList();

    public static String baseUrl() {
        return "https://" + base;
    }

    public static String authPageUrl() {
        return mainPage + "/login";
    }

    public static String bankList() {
        return mainPage + "/banki";
    }

    public static String resetPassword() {
        return mainPage + "/reset";
    }

    public static String becomePartnerPage() {
        return mainPage + "/become-partner";
    }

    public static String webMasterAuth() {
        return mainPage + "/partners/office/auth";
    }

    public static String partnersOfficeLoan() {
        return mainPage + "/partners/office/loan";
    }

    public static String webMasterPage() {
        return mainPage + "/partners/office";
    }

    public static String webMasterRegistrationPage() {
        return mainPage + "/partners/office/auth/registration";
    }

    public static String partnerResetPasswordPage() {
        return mainPage + "/partners/office/auth/reset";
    }

    public static String brokerAuth() {
        //return mainPage + "/b2b_office/auth/login";
        return mainPage + "/partners/office/auth";
    }

    public static String bankirAuth() {
        return mainPage + "/advertiser_office/auth";
    }

    public static String bankResetPassword() {
        return mainPage + "/advertiser_office/auth/reset";
    }

    public static String brokerCabinetUrl() {
        return mainPage + "/b2b_office/";
    }

    public static String privateCreditsPageUrl() {
        return mainPage + "/private/kredity?";
    }

    public static String privateCreditsCardPageUrl() {
        return mainPage + "/private/kreditnye-karty?";
    }

    public static String privateAutoCreditsPageUrl() {
        return mainPage + "/private/avtokredity";
    }

    public static String privateIpotekaPageUrl() {
        return mainPage + "/private/ipoteka?";
    }

    public static String privateMicroCreditsPageUrl() {
        return mainPage + "/private/mikrozajmy?";
    }

    public static String blogPageUrl() {
        return mainPage + "/articles";
    }

    public static String privateRefinancePageUrl() {
        return mainPage + "/private/refinance?";
    }

    public static String protectionPageUrl() {
        return mainPage + "/fraud-monitoring";
    }

    public static String adminRedirectsPage() {
        return mainPage + "/_ad_min_24/mfi/redirect/?q=";
    }

    public static String adminkaLogIn() {
        return mainPage + "/_ad_min_24/login/?next=/_ad_min_24/";
    }

    public static String adminkaTransactions() {
        return mainPage + "/_ad_min_24/wallet/transaction/add/";
    }

    public static String shopPage() {
        return "http://shop.unicom24.ru/";
    }

    public static String adminkaGetBalanceId(String userEmail) {
        return mainPage + "/_ad_min_24/wallet/balance/?_to_field=id&_popup=1&q=" + userEmail;
    }

    public static String aboutFullCreditHistoryPage() {
        return mainPage + "/services/polnaya-kreditnaya-istoriya";
    }

    public static String brokerRFZPageUrl() {
        return mainPage + "/b2b_office/financial-health";
    }

    public static String financialHealthRatingPage() {
        return mainPage + "/services/rejting-finansovogo-zdorovya";
    }

    public static String personalSelectionCreditPage() {
        return mainPage + "/form-offers-small-full/kredity";
    }

    public static String webMasterMicrocreditPage() {
        return mainPage + "/form-offers-small-webmaster/mikrozajmy?";
    } //некая рекламная страница на которую можно попасть только по ссылке

    public static String cashServicePage() {
        return mainPage + "/msb/raschetno-kassovoye-obsluzhivaniye";
    }

    public static String mfoPage() {
        return mainPage + "/mfo";
    }

    public static String subscriptionsInProfile() {
        return mainPage + "/user/subscriptions";
    }

    public static String recognizeYourRFZ() {
        return mainPage + "/services/rejting-finansovogo-zdorovya";
    }

    public static String creditCalculatorPageUrl() {
        return mainPage + "/services/credit-calculator";
    }

    public static String comparePage() {
        return mainPage + "/sravnenie";
    }

    public static String siteMapPage() {
        return mainPage + "/karta-sajta";
    }

    public static String vacancyPage() {
        return mainPage + "/hr";
    }

    public static String verificatePage() {
        return mainPage + "/verificate";
    }

    public static String profileReferralsPage() {
        return mainPage + "/partners/office/referrals";
    }

    public static String partnerProfilePersonalDataPage() {return mainPage + "/partners/office/profile";}

    public static String partnerProfileMainPage() {return mainPage + "/partners/office/profile?hash=basic-data";}

    public static String partnerProfileContactsPage() {return mainPage + "/partners/office/profile?hash=contacts";}

    public static String partnerProfileChangePasswordPage() {return mainPage + "/partners/office/profile?hash=password";}

    public static String partnerReportIssueTabPage() {return mainPage+"/partners/office/unreceived_requests";}

    public static String offersWallPage() {return mainPage+"/partners/office/offers";}
}
