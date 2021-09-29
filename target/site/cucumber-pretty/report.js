$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("KMEmissionAPIDescription.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "# language: ru"
    }
  ],
  "line": 4,
  "name": "Описание API Эмиссии КМ",
  "description": "",
  "id": "описание-api-эмиссии-км",
  "keyword": "Функционал",
  "tags": [
    {
      "line": 2,
      "name": "@test"
    }
  ]
});
formatter.scenario({
  "line": 12,
  "name": "Метод «Проверить доступность», проверка формата ответа на запрос",
  "description": "",
  "id": "описание-api-эмиссии-км;метод-«проверить-доступность»,-проверка-формата-ответа-на-запрос",
  "type": "scenario",
  "keyword": "Сценарий",
  "tags": [
    {
      "line": 11,
      "name": "@id-2"
    }
  ]
});
formatter.step({
  "line": 13,
  "name": "выполнен GET запрос на URL \"/api/mcdn/ping\" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200",
  "rows": [
    {
      "cells": [
        "HEADER",
        "clientToken",
        "123fdb5c-c6bd-4a5f-81ab-6230668d9cdd"
      ],
      "line": 14
    }
  ],
  "keyword": "Когда "
});
formatter.step({
  "line": 15,
  "name": "значение из \"clientToken\u003d123fdb5c-c6bd-4a5f-81ab-6230668d9cdd\" присутствует в ответе в переменной mainResp Сохранить в другую переменную saveTitle",
  "keyword": "Когда "
});
formatter.match({
  "arguments": [
    {
      "val": "/api/mcdn/ping",
      "offset": 28
    },
    {
      "val": "mainResp",
      "offset": 108
    },
    {
      "val": "200",
      "offset": 139
    }
  ],
  "location": "StepDefinitions.sendGETRequestAndSaveAnswer(String,String,int,DataTable)"
});
formatter.result({
  "duration": 8725791200,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "clientToken\u003d123fdb5c-c6bd-4a5f-81ab-6230668d9cdd",
      "offset": 13
    },
    {
      "val": "mainResp",
      "offset": 98
    },
    {
      "val": "saveTitle",
      "offset": 137
    }
  ],
  "location": "StepDefinitions.checkAnswer(String,String,String)"
});
formatter.result({
  "duration": 1204024200,
  "error_message": "java.lang.NullPointerException\r\n\tat MCDN.ApiMainLogic.checkAnswer(ApiMainLogic.java:232)\r\n\tat stepDef.StepDefinitions.checkAnswer(StepDefinitions.java:76)\r\n\tat ✽.Когда значение из \"clientToken\u003d123fdb5c-c6bd-4a5f-81ab-6230668d9cdd\" присутствует в ответе в переменной mainResp Сохранить в другую переменную saveTitle(KMEmissionAPIDescription.feature:15)\r\n",
  "status": "failed"
});
});