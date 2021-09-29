package stepDef;

import MCDN.ApiMainLogic;
import MCDN.CreateJson;
import cucumber.api.java.ru.Когда;
import cucumber.api.DataTable;
import paths.Paths;

import java.util.*;

public class StepDefinitions {

    ApiMainLogic apiMainLogic = new ApiMainLogic();
    CreateJson createJson = new CreateJson();
    String nameOfJson = null;
    Map<String, String> headers = new HashMap<>();
    Map<String, Object> params = new HashMap<>();
    String endPointForDelete = null;

    private void prepareData(List<List<String>> table) {
        for (List<String> strings : table) {
            switch (strings.get(0)) {
                case ("BODY"):
                    nameOfJson = strings.get(2);
                    break;
                case ("PARAMS"):
                    params.put(strings.get(1), strings.get(2));
                    break;
                case ("HEADER"):
                    if (ApiMainLogic.vars.containsKey(strings.get(2)) && ApiMainLogic.vars.containsKey("token")) {
                        headers.put(strings.get(1), "Bearer: " + ApiMainLogic.vars.get(strings.get(2)));
                    } else if (ApiMainLogic.vars.containsKey(strings.get(2))) {
                        headers.put(strings.get(1), ApiMainLogic.vars.get(strings.get(2)));
                    } else
                        headers.put(strings.get(1), strings.get(2));
                    break;
                case ("DELETE"):
                    endPointForDelete = strings.get(2);
            }
        }
    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ожидаемый код ответа: (.*)$")
    public void sendPOSTRequest(String url, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        prepareData(table);
        apiMainLogic.sendPOSTRequestAndCheckStatus(url, code, headers, Objects.requireNonNull(ApiMainLogic.takeJsonToSend(nameOfJson)));
    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы. значение из \"([^\"]*)\" сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendPOSTRequestAndSaveValue(String url, String value, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        apiMainLogic.sendPOSTRequestAndCheckStatusAndSaveValue(url, value, var, code, headers, Objects.requireNonNull(ApiMainLogic.takeJsonToSend(nameOfJson)));
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. значение из \"([^\"]*)\" сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendGETRequestAndSaveValue(String url, String value, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        apiMainLogic.sendGETRequestAndCheckStatusAndSaveValue(url, value, var, code, params, headers);
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ответ сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendGETRequestAndSaveAnswer(String url, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        apiMainLogic.sendGETRequestAndCheckStatusAndSaveAnswer(url, var, code, params, headers);
    }

    @Когда("^значение из \"([^\"]*)\" присутствует в ответе в переменной (.*) Сохранить в другую переменную (.*)$")
    public void checkAnswer(String jp, String varResp, String var){
        apiMainLogic.checkAnswer(jp, varResp, var);
    }

    @Когда("^выполнен DELETE запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ожидаемый код ответа: (.*)$")
    public void sendDELEATERequest(String url, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        prepareData(table);
        apiMainLogic.sendDELEATERequestAndCheckStatus(url, code, params, headers, endPointForDelete);
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ожидаемый код ответа: (.*)$")
    public void sendGETRequest(String url, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        prepareData(table);
        apiMainLogic.sendGETRequestWithParamAndCheckStatus(url, code, params, headers);
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\". Ожидаемый код ответа: (.*)$")
    public void sendGETRequest(String url, int code) {
        apiMainLogic.sendGETRequestAndCheckStatus(url, code);
    }

    @Когда("^подтягиваются куки в браузер$")
    public void preparationCookiesForSeleniumMethod() {
        apiMainLogic.preparationCookiesForSelenium();
    }
}
