package MCDN;

import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.openqa.selenium.Cookie;

import java.io.File;
import java.io.FileReader;
import java.lang.reflect.Method;
import java.util.*;

import static MCDN.Paths.getPropertiesInstance;
import static MCDN.Paths.pathToJsons;
import static io.restassured.RestAssured.given;

public class ApiMainLogic extends Base {

    public static Map<String, String> vars = new HashMap<>();
    public static Map<String, Response> varsForFullAnswer = new HashMap<>(); //// ???????
    public static Map<String, List<String>> varsForArrays = new HashMap<>();
    CreateJson createJson = new CreateJson();
    private String[] arrProjectID;

    public static JSONObject takeJsonToSend(String jsonFileName) {
        File file = new File(pathToJsons() + jsonFileName + ".json");
        JSONObject signUpFile = null;
        if (jsonFileName.equals("signUpWebMaster") | jsonFileName.equals("signUpAgent") | jsonFileName.equals("signUpType-9")) {
            try {
                TestContext.correctPhone = UserData.correctPhoneNumber;
                TestContext.generatedEmail = UserData.getRandomEmail();
                if (jsonFileName.equals("signUpType-9")) {
                    TestContext.loginType9ForOtherCases = TestContext.generatedEmail;
                }
                signUpFile = (JSONObject) readJsonSimpleDemo(file);
                signUpFile.replace("partner_phone", TestContext.correctPhone);
                signUpFile.replace("email", TestContext.generatedEmail);
                return signUpFile;

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            /*
            if (jsonFileName.equals("signInType-9")){
                try {
                signUpFile = (JSONObject) readJsonSimpleDemo(file);
                signUpFile.replace("login", TestContext.loginType9ForOtherCases);
                return signUpFile;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            */
            try {
                return (JSONObject) readJsonSimpleDemo(file);
            } catch (Exception ignored) {

            }
        }
        return null;
    }

    private static String invoke(String aClass, String aMethod) throws Exception {
        String resp = "";
        Class<?> c = Class.forName(aClass);
        Method m = c.getDeclaredMethod(aMethod);
        Object i = c.newInstance();
        resp = m.invoke(i).toString();

        return resp;
    }

    private String urlValue(String endPoint) {
        if (endPoint.startsWith("http"))
            return endPoint;
        Properties PROPERTIES = getPropertiesInstance();
        if (endPoint.startsWith("/")) {
//            PROPERTIES.setProperty("baseURI", PagesUrls.mainPage);
            return PROPERTIES.getProperty("baseURI") + endPoint;
        }

        if (!endPoint.startsWith("http") && (!endPoint.startsWith("/"))) {
            PROPERTIES.setProperty("baseURI", PagesUrls.mainPage);
            return PROPERTIES.getProperty("baseURI") + PROPERTIES.getProperty(endPoint);
        }

        if (PROPERTIES.getProperty(endPoint).startsWith("http"))
            return PROPERTIES.getProperty(endPoint);

        PROPERTIES.setProperty("baseURI", PagesUrls.mainPage);
        return PROPERTIES.getProperty("baseURI") + PROPERTIES.getProperty(endPoint);
    }

//        private String urlValue(String endPoint) {
//        if (endPoint.startsWith("http"))
//            return endPoint;
//        Properties PROPERTIES = Paths.getPropertiesInstance();
//        if (PROPERTIES.getProperty(endPoint).startsWith("http"))
//            return PROPERTIES.getProperty(endPoint);
//        return PROPERTIES.getProperty("baseURI") + PROPERTIES.getProperty(endPoint);
//    }

    private static Object readJsonSimpleDemo(File file) throws Exception {
        FileReader reader = new FileReader(file);
        JSONParser jsonParser = new JSONParser();
        return jsonParser.parse(reader);
    }

    public void sendPOSTRequestAndCheckStatus(String url,
                                              int code,
                                              Map<String, ?> header,
                                              JSONObject jsonObject) {
        String urlValue = urlValue(url);
        RequestSpecification requestSpecification =
                given().log().all()
                        .headers(header)
                        .contentType("application/json\r\n")
                        .body(jsonObject.toString());
        Response response =
                requestSpecification.when().post(urlValue);

        TestContext.cookies = response.getDetailedCookies();
        response.then().log().all()
                .statusCode(code);
    }

    public void preparationCookiesForSelenium() {

        try {
            Cookie ckName1 = new Cookie("nginx_unicom_ru",
                    TestContext.cookies.getList("nginx_unicom_ru").get(0).getValue(),
                    TestContext.cookies.getList("nginx_unicom_ru").get(0).getPath(),
                    TestContext.cookies.getList("nginx_unicom_ru").get(0).getExpiryDate());
            driver.manage().addCookie(ckName1);
        } catch (Exception ignored) {}


        Cookie ckName2 = new Cookie("csrftoken",
                TestContext.cookies.getList("csrftoken").get(0).getValue(),
                TestContext.cookies.getList("csrftoken").get(0).getPath(),
                TestContext.cookies.getList("csrftoken").get(0).getExpiryDate());

        Cookie ckName3 = new Cookie("sessionid",
                TestContext.cookies.getList("sessionid").get(0).getValue(),
                TestContext.cookies.getList("sessionid").get(0).getPath(),
                TestContext.cookies.getList("sessionid").get(0).getExpiryDate());

//        driver.manage().addCookie(ckName1);
        driver.manage().addCookie(ckName2);
        driver.manage().addCookie(ckName3);
    }

    public void sendPOSTRequestAndCheckStatusAndSaveValue(String url,
                                                          String value,
                                                          String var,
                                                          int code,
                                                          Map<String, ?> header,
                                                          JSONObject jsonObject) {
        String urlValue = urlValue(url);
        RequestSpecification requestSpecification =
                given().log().headers().log().body()
                        .headers(header)
                        .contentType("application/json\r\n")
                        .body(jsonObject.toString());
        Response response =
                requestSpecification.when().post(urlValue);

        response.then().log().body()
                .statusCode(code);
        String rbody = response.asString();
        JsonPath jp = new JsonPath(rbody);
        String valueOfKey = jp.getString(value);
        vars.put(var, valueOfKey);
        System.out.println(vars.get(var));
    }

    public void sendGETRequestAndCheckStatusAndSaveValue(String url,
                                                         String value,
                                                         String var,
                                                         int code,
                                                         Map<String, ?> parameters,
                                                         Map<String, ?> header) {
        String urlValue = urlValue(url);
        RequestSpecification requestSpecification =
                given().log().headers().log().all()
                        .queryParams(parameters)
                        .headers(header)
                        .contentType("application/json\r\n");
        Response response =
                requestSpecification.when().get(urlValue);

        response.then().log().body()
                .statusCode(code);
        String rbody = response.asString();
        JsonPath jp = new JsonPath(rbody);
        String str = jp.getString(value);
        str = str.replace("[", "").replace("]", "").replace("{","").replace("}","");
        String [] words = str.split(", ");
        List<String> valueOfKey = Arrays.asList(words);
        //List<String> valueOfKey = jp.getList(value);
        varsForArrays.put(var, valueOfKey);
        System.out.println(varsForArrays.get(var));
    }

    public void sendGETRequestAndCheckStatusAndSaveAnswer(String url,
                                                         String var,
                                                         int code,
                                                         Map<String, ?> parameters,
                                                         Map<String, ?> header) {

        String urlValue = urlValue(url);
        RequestSpecification requestSpecification =
                given().log().headers().log().all()
                        .queryParams(parameters)
                        .headers(header);
//                        .contentType("application/json\r\n");
        Response response =
                requestSpecification.when().get(urlValue);

        response.then().log().body()
                .statusCode(code);
        varsForFullAnswer.put(var, (Response) response.getBody());
        System.out.println(varsForFullAnswer.get(var));
    }

    public void checkAnswer(String jp, String varResp, String var){
        JsonPath jPath = new JsonPath(varsForFullAnswer.get(varResp).asString());
        String str = jPath.getString(jp);
        str = str.replace("[", "").replace("]", "").replace("{","").replace("}","");
        vars.put(var, str);
    }

    public void sendDELEATERequestAndCheckStatus(String url,
                                                 int code,
                                                 Map<String, ?> map,
                                                 Map<String, ?> header,
                                                 String delete) {
        String urlValue = urlValue(url);
        RequestSpecification requestSpecification =
                given().log().all()
                        .headers(header)
                        .queryParams(map)
                        .contentType("application/json\r\n");
        Response response =
                requestSpecification.when().delete(urlValue + "/" + delete);

        response.then().log().body()
                .statusCode(code);
    }

    public void sendGETRequestWithParamAndCheckStatus(String url, int code, Map<String, ?> map, Map<String, ?> header) {
        String urlValue = urlValue(url);
        RequestSpecification requestSpecification =
                given().log().all()
                        .queryParams(map)
                        .headers(header);
        Response response =
                requestSpecification.when().get(urlValue);

        response.then().log().all();
        response.then().assertThat().statusCode(code);
        //        .statusCode(code);
        //response.then().assertThat().body(matchesJsonSchema(Paths.pathToJsons() + "forCheckResponses" + "findByStatus.json"));
        //matchesJsonSchemaInClasspath("findByStatus.json"));
    }

    public void sendGETRequestAndCheckStatus(String url, int code) {
        String urlValue = urlValue(url);
        RequestSpecification requestSpecification =
                given().log().all();
        Response response =
                requestSpecification.when().get(urlValue);

        response.then().log().body()
                .statusCode(code);
        //response.then().assertThat().body(matchesJsonSchema(Paths.pathToJsons() + "forCheckResponses" + "findByStatus.json"));
        //matchesJsonSchemaInClasspath("findByStatus.json"));
    }
}
