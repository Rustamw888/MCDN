package stepDef;

import MCDN.ApiMainLogic;
import MCDN.CreateJson;
import com.google.gson.Gson;
import cucumber.api.DataTable;
import cucumber.api.java.ru.Когда;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.Assert;

import java.util.*;

import static MCDN.ApiMainLogic.takeJsonToSend;
import static MCDN.ApiMainLogic.takeJsonsTosend;

public class StepDefinitions {

    ApiMainLogic apiMainLogic = new ApiMainLogic();
    CreateJson createJson = new CreateJson();
    String nameOfJson = null;
    boolean isDataCorrect = true;
    Map<String, String> headers = new HashMap<>();
    Map<String, Object> params = new HashMap<>();
    String endPointForDelete = null;
    String field = "";
    int sizeOfJSONArray = 1;
    static final ArrayList<String> errorKeysExpected = new ArrayList();
    static {
        errorKeysExpected.add("errorCode");
        errorKeysExpected.add("errorText");
        Collections.sort(errorKeysExpected);
    }


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
        JSONArray jsonArray = takeJsonsTosend(nameOfJson);
        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.size(); i++) {
                System.out.println("\nЗапрос на сервер:" + jsonArray.get(i));
                apiMainLogic.sendPOSTRequestCheckAndSaveAnswer(url, value, var + (i + 1), code, params, headers, (JSONObject) jsonArray.get(i));
            }
        } else
            apiMainLogic.sendPOSTRequestCheckAndSaveAnswer(url, value, var, code, params, headers, takeJsonToSend(nameOfJson));
        System.out.println("\nОтветы сервера:" + ApiMainLogic.vars);
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Значение из \"([^\"]*)\" присутствует. Ответ сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendGETRequestCheckAndSaveAnswer(String url, String value, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        apiMainLogic.sendGETRequestCheckAndSaveAnswer(url, value, var, code, params, headers);
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Значение из \"([^\"]*)\" присутствует. 1Ответ сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void test(String url, String value, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        apiMainLogic.test(url, value, var, code, params, headers);
    }

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Значения из проверочной таблицы присутствуют. Ожидаемый код ответа: (.*)$")
    public void sendGETRequestCheckWrongKey(String url, DataTable dataTable, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        field = dataTable.asLists(String.class).get(0).get(0);
        apiMainLogic.sendGETRequestCheckWrongKey(url, field, code, params, headers);
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

    @Когда("^выполнен GET запрос на URL \"([^\"]*)\" с параметрами из таблицы. Ключ сохранить в переменную с именем (.*) Ожидаемый код ответа: (.*)$")
    public void sendGETRequestCheckWrongKey(String url, String var, int code, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        apiMainLogic.sendGETRequestCheckWrongKey(url, var, code, params, headers);
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
    public void checkStrippedAnswerWithAssert(String varResp, String varValue){
        apiMainLogic.checkAnswerWithAssert(varResp, varValue.replace("[", "").replace("]", "").replace("{","").replace("}",""));
    }

    @Когда("^ответ сервера, сохраненный в переменную (.*) равен (.*)$")
    public void checkAnswerWithAssert(String varResp, String varValue){
        apiMainLogic.checkFullAnswerWithAssert(varResp, varValue);
    }

    @Когда("^рандомное значение в переменной (.*) соответствует формату, длина равна (.*)")
    public void checkAnswerWithLength(String varResp, String varValue){
        apiMainLogic.checkAnswerWithLength(varResp, varValue);
    }

    @Когда("^рандомное значение в переменной (.*) не соответствует формату, длина не равна (.*)")
    public void checkAnswerWithLengthFalse(String varResp, String varValue){
        apiMainLogic.checkAnswerWithLengthFalse(varResp, varValue);
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
        field = dataTable.asLists(String.class).get(0).get(0);
    }

    @Когда("^значение в переменной (.*) не равно$")
    public void selectFieldsForGet(String varResp, DataTable dataTable) {
        apiMainLogic.checkAnswerWithAssertNotEquals(varResp, field.replace("[", "").replace("]", "").replace("{","").replace("}",""));
        field = dataTable.asLists(String.class).get(0).get(0);
    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с замененными вышеперечисленными полями некорректными данными$")
    public void sendPOSTRequestWithIncorrectDataThenCheckAndSaveAnswer(String url, DataTable arg) {
        List<List<String>> table = arg.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        JSONArray jsonArray = takeJsonsTosend(nameOfJson);
        ApiMainLogic.codes.clear();
        if (jsonArray != null) {
            sizeOfJSONArray = jsonArray.size();
            for (int i = 0; i < sizeOfJSONArray; i++) {
                apiMainLogic.sendIncorrectData(field, url, (JSONObject) jsonArray.get(i), params, headers, i);
            }
        } else {
            apiMainLogic.sendIncorrectData(field, url, takeJsonToSend(nameOfJson), params, headers, null);
        }

    }

    @Когда("проверить коды ответов для замененных значений полей значениями некорректных типов данных")
    public void checkAnswersCodes(DataTable dataTable) {
        List<String> strSetsCodes = dataTable.asLists(String.class).get(1);
        List<String> sortedStrCodes =new ArrayList<>();
        List<Integer> codes = new ArrayList<>();
        for (int i = 0; i < sizeOfJSONArray; i++) {
            for (String strSetCodes : strSetsCodes) {
                String[] strCodes = strSetCodes.split(",");
                sortedStrCodes.add(strCodes[i].trim());
            }
        }
        for (String code: sortedStrCodes) {
            codes.add(Integer.parseInt(code.trim()));
        }
        System.out.println("\nОжидаемые коды: " + codes);
        System.out.println("Реальные  коды: " + ApiMainLogic.codes);
        Assert.assertEquals(codes, ApiMainLogic.codes);
    }

    @Когда("проверить ответы сервера при некорректных отправленных данных")
    public void checkServersAnswers() {
        ArrayList<String> keys = new ArrayList<>(ApiMainLogic.varsForFullAnswer.keySet());

        for (String key: keys) {
            if (!Integer.toString(ApiMainLogic.varsForFullAnswer.get(key).getStatusCode()).startsWith("2")) {
                HashMap<String,Object> result = new Gson().fromJson(ApiMainLogic.varsForFullAnswer.get(key).getBody().asString(), HashMap.class);
                ArrayList<String> errorKeysActual = new ArrayList<>(result.keySet());
                Collections.sort(errorKeysActual);
                Assert.assertEquals(errorKeysExpected, errorKeysActual);
            }
        }

    }

//    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы и удаленным элементом (.*) из JSON файла, ответ сохранить в переменную (.*)$")
//    public void jSONRowDeleting(String url, String jsonField, String var, DataTable dataTable) {
//        List<List<String>> table = dataTable.asLists(String.class);
//        System.out.println(table);
//        prepareData(table);
//        JSONArray jsonArray = takeJsonsTosend(nameOfJson);
//        if (jsonArray != null) {
//            for (int i = 0; i < jsonArray.size(); i++) {
//                apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url,var + (i + 1), params, headers, (JSONObject) ((JSONObject) jsonArray.get(i)).remove(jsonField));
//            }
//        } else
//            apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url, var, params, headers, (JSONObject) takeJsonToSend(nameOfJson).remove(jsonField));
//        System.out.println("\nОтветы сервера:" + ApiMainLogic.vars);
//    }


    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы и удаленным элементом (.*) из JSON файла, ответ сохранить в переменную (.*)$")
    public void jSONRowDeleting(String url, String jsonField, String var, DataTable dataTable) {
        List<List<String>> table = dataTable.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        JSONArray jsonArray = takeJsonsTosend(nameOfJson);
        ApiMainLogic.codes.clear();
        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.size(); i++) {
                sizeOfJSONArray = jsonArray.size();
                JSONObject test = (JSONObject) jsonArray.get(i);
                test.remove(jsonField);
                apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url,var + "_" + (i + 1), params, headers, test);
            }
        } else {
            JSONObject test = takeJsonToSend(nameOfJson);
            test.remove(jsonField);
            apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url, var, params, headers, test);
        }
    }

    @Когда("^проверить коды ответов (.*) для JSONов с измененными или удаленными полями в (.*)$")
    public void checkCodesWithRemovedFields(String strGluedCodes, String var) {
        String[] strCodes = strGluedCodes.split(",");
        for (int i = 0; i < sizeOfJSONArray; i++) {
            Assert.assertEquals(Integer.parseInt(strCodes[i].trim()), (int) ApiMainLogic.codes.get(i));
        }
    }

//        if (jsonArray != null) {
//            for (int i = 0; i < jsonArray.size(); i++) {
//                apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url,var + (i + 1), params, headers, (JSONObject) ((JSONObject) jsonArray.get(i)).remove(jsonField));
//            }
//        } else
//            apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url, var, params, headers, (JSONObject) takeJsonToSend(nameOfJson).remove(test));
//        System.out.println("\nОтветы сервера:" + ApiMainLogic.vars);
//    }

//    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы и удаленным элементом (.*) из JSON файла, ответ сохранить в переменную (.*)$")
//    public void jSONRowDeleting(String url, String jsonField, String var, DataTable dataTable) {
//        List<List<String>> table = dataTable.asLists(String.class);
//        System.out.println(table);
//        prepareData(table);
//        JSONArray jsonArray = takeJsonsTosend(nameOfJson);
//
//        ArrayList<String> list = new ArrayList<>();
//        String[] array = list.toArray(new String[0]);
//        for (int i = 0; i < list.size(); i++) {
//            list.add(jsonField);
//        }
//        if (jsonArray != null) {
//            for (int i = 0; i < jsonArray.size(); i++) {
////                delete jsonArray[i].jsonField;
//                JSONObject test = (JSONObject) ((JSONObject) jsonArray.get(i)).remove(jsonField);
//                apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url, var + (i + 1), params, headers, test);
//            }
//        } else {
//            JSONObject test = (JSONObject) Objects.requireNonNull(takeJsonToSend(nameOfJson)).remove(jsonField);
////            StringBuffer test = "fdfgdf";
////            test.delete(jsonField);
////            deserializeJson(doc, input);
////        JsonObject crew = doc["Survivors"];
////        crew.remove("Ellis");
////        serializeJsonPrety(object, Serial);
//            apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url, var, params, headers, test);
//        }
//    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы и измененным элементом (.*) из JSON файла, ответ сохранить в переменную (.*)$")
    public void jSONRowChanging(String url, String jsonField, String var, DataTable dataTable) {
        List<List<String>> table = dataTable.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        JSONArray jsonArray = takeJsonsTosend(nameOfJson);
        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.size(); i++) {
                apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url,var + (i + 1), params, headers, (JSONObject) ((JSONObject) jsonArray.get(i)).remove(jsonField));
            }
        } else
            apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url, var, params, headers, (JSONObject) takeJsonToSend(nameOfJson).remove(jsonField));
        System.out.println("\nОтветы сервера:" + ApiMainLogic.vars);
    }

    @Когда("^выполнен POST запрос на URL \"([^\"]*)\" с параметрами из таблицы и значения элементов (.*) из JSON файла изменены на (.*), ответ сохранить в переменную (.*)$")
    public void jSONRowDeleting(String url, String jsonField, Object changingValue, String var, DataTable dataTable) {
        List<List<String>> table = dataTable.asLists(String.class);
        System.out.println(table);
        prepareData(table);
        if (changingValue.equals("\"\"")) {
            changingValue = "";
        }
        ApiMainLogic.codes.clear();
        JSONArray jsonArray = takeJsonsTosend(nameOfJson);
        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.size(); i++) {
                sizeOfJSONArray = jsonArray.size();
                JSONObject test = (JSONObject) jsonArray.get(i);
                test.put(jsonField, changingValue);
                apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url,var + (i + 1), params, headers, test);
            }
        } else {
            JSONObject test = takeJsonToSend(nameOfJson);
            test.put(jsonField, changingValue);
            apiMainLogic.sendIncorrectPOSTRequestAndCheckAnswer(url, var, params, headers, test);
        }

        System.out.println("\nОтветы сервера:" + ApiMainLogic.vars);
    }

    @Когда("^проверить ответы сервера для JSONов с измененными или удаленными полями в (.*)$")
    public void jSONAnswerChecking(String var) {
        ArrayList<String> keys = new ArrayList<>(ApiMainLogic.varsForFullAnswer.keySet());
        for (String key: keys) {
            if (key.contains(var) && !Integer.toString(ApiMainLogic.varsForFullAnswer.get(key).getStatusCode()).startsWith("2")) {
                HashMap<String,Object> result = new Gson().fromJson(ApiMainLogic.varsForFullAnswer.get(key).getBody().asString(), HashMap.class);
                ArrayList<String> errorKeysActual = new ArrayList<>(result.keySet());
                Collections.sort(errorKeysActual);
                Assert.assertEquals(errorKeysExpected, errorKeysActual);
            }
        }
    }
}
