package stepDef;

import MCDN.ApiMainLogic;
import MCDN.CreateJson;
import cucumber.api.DataTable;
import cucumber.api.java.ru.Когда;
import data.IncorrectData;
import org.json.simple.JSONObject;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import static MCDN.ApiMainLogic.takeIncorrectJsonToSend;
import static MCDN.ApiMainLogic.takeJsonToSend;

public class StepDefinitions {

    ApiMainLogic apiMainLogic = new ApiMainLogic();
    CreateJson createJson = new CreateJson();
    String nameOfJson = null;
    boolean isDataCorrect = true;
    Map<String, String> headers = new HashMap<>();
    Map<String, Object> params = new HashMap<>();
    String endPointForDelete = null;
    List<String> fields = Collections.emptyList();

    private void prepareData(List<List<String>> table) {
        for (List<String> strings : table) {
            switch (strings.get(0)) {
                case ("BODY"):
//                    if (strings.get(1).equals("incorrect data")) {
//                        isDataCorrect = false;
//                    }
//                    else {
                        nameOfJson = strings.get(2);
//                    }

                    break;
                case ("PARAMS"):
                    if (strings.get(2).equals("mainResp")) {
                        params.put(strings.get(1), ApiMainLogic.vars.get("mainResp"));
                    } else if (strings.get(2).equals("secondResp")) {
                        params.put(strings.get(1), ApiMainLogic.vars.get("secondResp"));
                    } else {
                        params.put(strings.get(1), strings.get(2));
                    }
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
//        if (isDataCorrect)
            apiMainLogic.sendPOSTRequestAndCheckStatus(url, code, headers, params, takeJsonToSend(nameOfJson));
//        else
//            apiMainLogic.sendPOSTRequestAndCheckStatus(url, code, headers, params, takeIncorrectJsonToSend(nameOfJson));
    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы. значение из \"([^\"]*)\" сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendPOSTRequestAndSaveValue(String url, String value, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
//        if (isDataCorrect)
            apiMainLogic.sendPOSTRequestAndCheckStatusAndSaveValue(url, value, var, code, params, headers, takeJsonToSend(nameOfJson));
//        else
//            apiMainLogic.sendPOSTRequestAndCheckStatusAndSaveValue(url, value, var, code, params, headers, takeIncorrectJsonToSend(nameOfJson));
    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы. Значение из \"([^\"]*)\" присутствует. Ответ сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendPOSTRequestCheckAndSaveAnswer(String url, String value, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
//        if (isDataCorrect)
            apiMainLogic.sendPOSTRequestCheckAndSaveAnswer(url, value, var, code, params, headers, takeJsonToSend(nameOfJson));
//        else
//            apiMainLogic.sendPOSTRequestCheckAndSaveAnswer(url, value, var, code, params, headers, takeIncorrectJsonToSend(nameOfJson));
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Значение из \"([^\"]*)\" присутствует. Ответ сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendGETRequestCheckAndSaveAnswer(String url, String value, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        apiMainLogic.sendGETRequestCheckAndSaveAnswer(url, value, var, code, params, headers);
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

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ответ сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendPOSTRequestAndSaveAnswer(String url, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
//        if (isDataCorrect)
            apiMainLogic.sendPOSTRequestAndCheckStatusAndSaveAnswer(url, var, code, params, headers, takeJsonToSend(nameOfJson));
//        else
//            apiMainLogic.sendPOSTRequestAndCheckStatusAndSaveAnswer(url, var, code, params, headers, takeIncorrectJsonToSend(nameOfJson));
    }

    @Когда("^значение из \"([^\"]*)\" присутствует в ответе в переменной (.*) Сохранить в другую переменную (.*)$")
    public void checkAnswer(String jp, String varResp, String var){
        apiMainLogic.checkAnswer(jp, varResp, var);
    }

    @Когда("^значение в переменной (.*) и равно (.*)$")
    public void checkAnswerWithAssert(String varResp, String varValue){
        apiMainLogic.checkAnswerWithAssert(varResp, varValue.replace("[", "").replace("]", "").replace("{","").replace("}",""));
    }

    @Когда("^рандомное значение в переменной (.*) соответствует формату, длина равна (.*)")
    public void checkAnswerWithLength(String varResp, String varValue){
        apiMainLogic.checkAnswerWithLength(varResp, varValue);
    }

    @Когда("^выполнен DELETE запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ожидаемый код ответа: (.*)$")
    public void sendDELEATERequest(String url, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        prepareData(table);
        apiMainLogic.sendDELEATERequestAndCheckStatus(url, code, params, headers, endPointForDelete);
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ожидаемый код ответа: (.*), ожидаемая структура ответа: (.*)$")
    public void sendGETRequest(String url, int code, String jsonFileName, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        prepareData(table);
        apiMainLogic.sendGETRequestWithParamAndCheckStatus(url, code, params, headers, jsonFileName);
    }

    @Когда("^POST запрос выполнен на URL \"([^\"]*)\" с параметрами из таблицы. Ожидаемый код ответа: (.*), ожидаемая структура ответа: (.*)$")
    public void sendPOSTRequestWithJsonChecking(String url, int code, String jsonFileName, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        prepareData(table);
        apiMainLogic.sendPOSTRequestWithParamAndCheckStatus(url, code, params, headers, jsonFileName, takeJsonToSend(nameOfJson));
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\". Ожидаемый код ответа: (.*)$")
    public void sendGETRequest(String url, int code) {
        apiMainLogic.sendGETRequestAndCheckStatus(url, code);
    }

    @Когда("^подтягиваются куки в браузер$")
    public void preparationCookiesForSeleniumMethod() {
        apiMainLogic.preparationCookiesForSelenium();
    }

    @Когда("выбираем следующие поля JSONа для замены некорректными данными")
    public void selectFields(DataTable dataTable) {
        fields = dataTable.asLists(String.class).get(0);
        System.out.println("\nСписок данных: " + fields);
    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с замененными вышеперечисленными полями некорректными данными$")
    public void sendPOSTRequestWithIncorrectDataThenCheckAndSaveAnswer(
            String url,
//            String value, String var, int code,
            DataTable arg
    ) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        Field[] fields = IncorrectData.class.getFields();
        try {
            for (Field field: fields) {
                System.out.println("\nПоле типа " + field.getType() + ": " + field.get(new IncorrectData()));
                JSONObject jsonObject = takeJsonToSend(nameOfJson);
                for (String jsonField: this.fields) {
                    String[] path = jsonField.split("\\.");
                    switch (path.length) {
                        case (1):
                            jsonObject.remove(path[0]);
                            jsonObject.put(path[0], field.get(new IncorrectData()));
                            break;
//                        case (2):
//                            jsonObject.getJSONObject()
                    }
                }
                apiMainLogic.sendPOSTRequestAndCheckStatusAndSaveAnswer(url,"response", 400, params, headers, jsonObject);
            }
        } catch (Exception ignored) {
        }
    }

}
