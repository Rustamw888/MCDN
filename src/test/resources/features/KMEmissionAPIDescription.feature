# language: ru
@test

Функционал: Описание API Эмиссии КМ

  @id-1
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Значение из "success" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда значение в переменной mainResp и равно true

  @id-1.1
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос (негативный тест, проверка на неверное значение ответа)
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"ping.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @id-1.0
  Сценарий: Проверка запроса на некорректный эндпоинт
    Когда выполнен GET запрос на URL "/api/abrakadabra" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 404
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда ответ сервера, сохраненный в переменную errorResp равен <html><head><title>Error</title></head><body>Not Found</body></html>

  @id-2
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "omsId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда значение в переменной mainResp и равно a2a16a41-42b0-4309-9ae1-c19d53cc544f
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36

  @id-2.1
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, проверка ответов сервера на некорректные данные)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/order" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле        |Код null   |Код int    |Код double |Код string |Код empty string|Код bool   |
      |cisType     |400,400,400|200,200,200|400,400,400|400,400,400|400, 400, 400   |400,400,400|
      |productGroup|400,400,400|400,400,400|400,400,400|400,400,400|400, 400, 400   |400,400,400|

#    1) проверка на некорректные параметры запроса
#    2) подобрать ошибки под измененные строки джэйсона
#    3) подобрать ошибки под удаленные строки джэйсона
#    4) внести возможность менять cisType для каждого джейсона с индивидуальными ошибками


  @id-2.3
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с удалением)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и удаленным элементом <field> из JSON файла, ответ сохранить в переменную mainResp
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson4 |
#    Когда проверить ответы сервера в переменной mainResp с учетом изменения JSON файла - <field>, <code> и <text error>
    Примеры:
      |field            |  code | text error  |
      |gtin             |  400  |{"errorCode": 9991,"errorText": "gtin: не должно равняться null"}|
      |quantity         |  400  |{"errorCode": 9991,"errorText": "quantity: должно быть не меньше 1"}|
      |serialNumberType |  400  |{"errorCode": 9991,"errorText": "serialNumberType: не должно равняться null"}|
      |serialNumbers    |  400  |{"errorCode": 9991,"errorText": "При значении \"Пользователем (SELF_MADE)\" параметра \"Способ формирования серийного номера\" {serialNumberType} должны быть указаны серийные номера"}|
      |cisType          |  400  |{"errorCode": 9991,"errorText": "Не указан тип КМ"}|
      |releaseMethodType|  400  |{"errorCode": 9991,"errorText": "ReleaseMethodType не указан"}|
      |attributes       |  200  |               |
      |productGroup     |  400  |{"errorCode": 9991,"errorText": "productGroup: не должно равняться null"}|
      |productionOrderId|  200  |               |

  @id-2.4
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой на некорректные значения)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и значения элементов <field> из JSON файла изменены на <changingValue>, ответ сохранить в переменную mainResp
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда проверить ответы сервера в переменной mainResp с учетом изменения JSON файла - <field>, <changingValue>, <code> и <text error>
    Примеры:
      |field            |changingValue|  code | text error  |
      |gtin             |      ""     |  400  |{"errorCode": 9991,"errorText": "gtin: должно соответствовать \"^[0-9]{14}$\""}|
      |quantity         |      0      |  400  |{"errorCode": 9991,"errorText": "quantity: должно быть не меньше 1"}|
      |serialNumberType |   OPERATOR  |  400  |{"errorCode": 9991,"errorText": "При значении \"Автоматически (OPERATOR)\" параметра \"Способ формирования серийного номера\" {serialNumberType} не должны быть указаны серийные номера"}|
      |serialNumbers    |      ""     |  400  |{"errorCode": 9991,"errorText": "Количество серийных номеров не соответствует количеству КМ в заказе"}|
      |cisType          |      ""     |  400  |{"errorCode": 9991,"errorText": "JSON parse error: Cannot coerce empty String (\"\") to `codes.mcdn.common.model.order.CisType` value (but could if coercion was enabled using `CoercionConfig`); nested exception is com.fasterxml.jackson.databind.exc.InvalidFormatException: Cannot coerce empty String (\"\") to `codes.mcdn.common.model.order.CisType` value (but could if coercion was enabled using `CoercionConfig`)\n at [Source: (PushbackInputStream); line: 10, column: 14] (through reference chain: codes.mcdn.common.model.order.McdnOrderDto[\"cisType\"])"}|
      |releaseMethodType|      ""     |  400  |{"errorCode": 9991,"errorText": "JSON parse error: Cannot coerce empty String (\"\") to `codes.mcdn.common.model.order.ReleaseMethodType` value (but could if coercion was enabled using `CoercionConfig`); nested exception is com.fasterxml.jackson.databind.exc.InvalidFormatException: Cannot coerce empty String (\"\") to `codes.mcdn.common.model.order.ReleaseMethodType` value (but could if coercion was enabled using `CoercionConfig`)\n at [Source: (PushbackInputStream); line: 11, column: 24] (through reference chain: codes.mcdn.common.model.order.McdnOrderDto[\"releaseMethodType\"])"}|
      |attributes       |      ""     |  400  |{"errorCode": 9991,"errorText": "JSON parse error: Cannot coerce empty String (\"\") to element of `java.util.LinkedHashMap<java.lang.String,java.lang.Object>` (but could if coercion was enabled using `CoercionConfig`); nested exception is com.fasterxml.jackson.databind.exc.InvalidFormatException: Cannot coerce empty String (\"\") to element of `java.util.LinkedHashMap<java.lang.String,java.lang.Object>` (but could if coercion was enabled using `CoercionConfig`)\n at [Source: (PushbackInputStream); line: 12, column: 17] (through reference chain: codes.mcdn.common.model.order.McdnOrderDto[\"attributes\"])"}|
      |productGroup     |      ""     |  400  |{"errorCode": 9991,"errorText": "JSON parse error: Cannot construct instance of `codes.mcdn.common.model.ProductGroupType`, problem: `java.lang.IllegalArgumentException`; nested exception is com.fasterxml.jackson.databind.exc.ValueInstantiationException: Cannot construct instance of `codes.mcdn.common.model.ProductGroupType`, problem: `java.lang.IllegalArgumentException`\n at [Source: (PushbackInputStream); line: 17, column: 19] (through reference chain: codes.mcdn.common.model.order.McdnOrderDto[\"productGroup\"])"}|
      |productionOrderId|      ""     |  400  |{"errorCode": 9991,"errorText": "productionOrderId: должно соответствовать \"^([^\\x00-\\x1F]{1,256})$\""}|

  @id-2.5
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой cisType)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и значения элементов <field> из JSON файла изменены на <changingValue>, ответ сохранить в переменную mainResp
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
#    Когда проверить ответы сервера в переменной mainResp с учетом изменения JSON файла - <field>, <changingValue>, <code> и <text error>
    Примеры:
      |field   |  changingValue  |  code | text error  |
      |cisType |      "UNIT"     |  200  ||
      |cisType |      "GROUP"    |  200  ||
      |cisType |      "SET"      |  200  ||
#    вместо обычной проверки лучше использовать проверку из 2.4. + возможно имеет смысл обыграть в цикле для файла myJson(уточнить)
#
#  @id-2.6
#  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой cisType для товарной группы water)
#    Когда выполнен POST запрос на URL "/api/mcdn/order" с замененными вышеперечисленными полями некорректными данными
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
#      | BODY |  | orderCreation/myJsonWater |
#    Когда проверить ответы сервера при некорректных отправленных данных
#    Примеры:
#      |Поле |Код null|
#      |UNIT |   200  |
#      |GROUP|   200  |
#      |SET  |   200  |
##    вместо обычной проверки лучше использовать проверку из 2.3.
#
#  @id-2.7
#  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой cisType для товарной группы beer)
#    Когда выполнен POST запрос на URL "/api/mcdn/order" с замененными вышеперечисленными полями некорректными данными
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
#      | BODY |  | orderCreation/myJsonBeer |
#    Когда проверить ответы сервера при некорректных отправленных данных
#    Примеры:
#      |Поле |Код null|
#      |UNIT |   200  |
#      |GROUP|   200  |
#      |SET  |   200  |
##    вместо обычной проверки лучше использовать проверку из 2.3.

  @id-3
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: allOrders
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#    добавить проверку на неверный токен, уточнить нужны и целесообразны ли тут еще проверки?
#  возможно добавить проверку на количество, что больше чем 1, уточнить целесообразность

  @id-4
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: orderSecond
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    #    добавить проверку на неверный токен, уточнить нужны и целесообразны ли тут еще проверки?
#  добавить проверку на неверный ордерайди

  @id-5
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами»
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Значение из "recipientOrderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда значение в переменной mainResp и равно 77f791ed-2d6d-407d-970b-dd4b87377e5e
      #    выполнить проверку ответа с существующими данными

  @id-5.1
  Структура сценария: Метод «Передача кодов маркировки между сервис-провайдерами» (негативный тест, проверка ответов сервера на некорректные данные)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Значение из "recipientOrderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера
      |response_with_boolean_type_value|<response_with_boolean_type_value>|
      |response_with_double_type_value |<response_with_double_type_value> |
      |response_with_int_type_value    |<response_with_int_type_value>    |
      |response_with_string_type_value |<response_with_string_type_value> |
      |response_with_null_type_value   |<response_with_null_type_value>   |
    Примеры:
      |Поле       |Код null|Код int|Код double|Код string|Код empty string|Код bool|response_with_null_type_value                                                       |response_with_int_type_value                           |response_with_double_type_value                        |response_with_string_type_value                        |response_with_boolean_type_value                       |
      |orderId    |400     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"orderId: не должно равняться null"}                  |{"errorCode":9991,"errorText":"Заказ 0 не найден"}     |{"errorCode":9991,"errorText":"Заказ 0.0 не найден"}   |{"errorCode":9991,"errorText":"Заказ test не найден"}  |{"errorCode":9991,"errorText":"Заказ false не найден"} |
      |quantity   |500     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"HV000028: Unexpected exception during isValid call."}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|
      |recipientId|500     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"HV000028: Unexpected exception during isValid call."}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|
# после фикса бага исправить результаты ошибок + добавить проверку на неверные вводимые значения + проверка ключа + добавить проверку на вэлью ответа (возможно на длину строки и не содержание недопустимых символов)

  @id-6
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки»
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: kMOrders
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | 1 |
      | PARAMS | orderId | b9316c13-a71c-4440-a080-fa7260366d32 |
    # после фикса бага добавить проверку на неверные вводные данные + (возможно на длину строки и не содержание недопустимых символов), уточнить целесообразность из за игнорирования вэлью

  @id-7
  Сценарий: Метод «Получить статус обработки отчета»
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
    Когда значение в переменной mainResp и равно b6ddf431-4296-4ae5-9f4b-198ab92bc4ff
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
    Когда значение в переменной mainResp и равно SENT_SYSTEM

#  @id-7.1
#  Структура сценария: Метод «Получить статус обработки отчета» (негативный тест, проверка на неверное значение ответа)
#    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
#    Когда значение в переменной mainResp не равно
#      |<Значение>|
#    Примеры:
#      |Значение|
#      | 12 |
#    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
#    Когда значение в переменной mainResp не равно
#      |<Значение>|
#    Примеры:
#      |Значение|
#      | 12 |
#    улучшить проверку значений вэльюсов + добавить проверку на неверные вводные данные + проверка ключей

  @id-8
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson1 |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда значение в переменной mainResp и равно 10
#    разобраться со статусом запроса, что не READY

  @id-8.1
  Структура сценария: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, проверка данных ответа с неправильным форматом)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson1 |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда значение в переменной mainResp не равно
      |<Значение>|
    Примеры:
      |Значение|
      | 12 |
#    улучшить метод проверки переменной на вэльюсы + добавить проверку ключей + добавить проверку на неверные данные запроса

  @id-8.2
  Структура сценария: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson1 |
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера
      |response_with_boolean_type_value|<response_with_boolean_type_value>|
      |response_with_double_type_value |<response_with_double_type_value> |
      |response_with_int_type_value    |<response_with_int_type_value>    |
      |response_with_string_type_value |<response_with_string_type_value> |
      |response_with_null_type_value   |<response_with_null_type_value>   |
    Примеры:
      |Поле       |Код null|Код int|Код double|Код string|Код empty string|Код bool|response_with_null_type_value                                          |response_with_int_type_value                           |response_with_double_type_value                        |response_with_string_type_value                        |response_with_boolean_type_value                       |
      |sntinsCount|400     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"sntinsCount: не должно равняться null"} |{"errorCode":9991,"errorText":"Заказ 0 не найден"}     |{"errorCode":9991,"errorText":"Заказ 0.0 не найден"}   |{"errorCode":9991,"errorText":"Заказ test не найден"}  |{"errorCode":9991,"errorText":"Заказ false не найден"} |

#    после фикса бага, прописать правильные ответы и коды ошибок

  @id-9
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Значение из "valid" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда значение в переменной mainResp и равно true

  @id-9.1
  Структура сценария: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, проверка данных ответа с неправильным форматом)
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Значение из "valid" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда значение в переменной mainResp не равно
      |<Значение>|
    Примеры:
      |Значение|
      | 12 |
    #    улучшить метод проверки переменной на вэльюсы + добавить проверку ключей + добавить проверку на неверные данные запроса

  @id-9.2
  Структура сценария: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Значение из "valid" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера
      |response_with_boolean_type_value|<response_with_boolean_type_value>|
      |response_with_double_type_value |<response_with_double_type_value> |
      |response_with_int_type_value    |<response_with_int_type_value>    |
      |response_with_string_type_value |<response_with_string_type_value> |
      |response_with_null_type_value   |<response_with_null_type_value>   |
    Примеры:
      |Поле |Код null|Код int|Код double|Код string|Код empty string|Код bool|response_with_null_type_value                                          |response_with_int_type_value                           |response_with_double_type_value                        |response_with_string_type_value                        |response_with_boolean_type_value                       |
      |valid|400     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"valid: не должно равняться null"} |{"errorCode":9991,"errorText":"Заказ 0 не найден"}     |{"errorCode":9991,"errorText":"Заказ 0.0 не найден"}   |{"errorCode":9991,"errorText":"Заказ test не найден"}  |{"errorCode":9991,"errorText":"Заказ false не найден"} |

#    после фикса бага, прописать правильные ответы и коды ошибок

  @id-10
  Сценарий: Метод «Отправить отчет об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем secondResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда рандомное значение в переменной secondResp соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем secondResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда значение в переменной secondResp и равно 2
#    добавить негативный на некорректные данные в запросе + проверка, что длина не равна 36(уточнить необходимость + было описано выше) + проверка ключей + улучшить проверку значений в ответе

  @id-10.1
  Структура сценария: Метод «Отправить отчет об агрегации КМ» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле                            |Код null|Код int|Код double|Код string|Код empty string|Код bool|
      |orderId                         |400     |400    |400       |400       |400             |400     |
      |aggregationUnits.sntins.code    |500     |400    |400       |400       |400             |400     |
      |aggregationUnits.aggregationType|400     |200    |400       |400       |400             |400     |

  @id-10.2
  Структура сценария: Метод «Отправить отчет об агрегации КМ» (негативный тест, проверка данных ответа с неправильным форматом)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем secondResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда рандомное значение в переменной secondResp соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем secondResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда значение в переменной secondResp не равно
      |<Значение>|
    Примеры:
      |Значение|
      | 12 |
    #    улучшить метод проверки переменной на вэльюсы

  @id-11
  Структура сценария: Метод «Отправить отчет об использовании (нанесении) КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда значение в переменной secondResp и равно 2
    Примеры:
      |Jsons|
      |utilisationReports/utilisationReport1|
      |utilisationReports/utilisationReport2|
      |utilisationReports/utilisationReport3|
      |utilisationReports/utilisationReport4|
#    блокер, не верный формат КМ
  #    добавить негативный на некорректные данные в запросе + проверка, что длина не равна 36(уточнить необходимость + было описано выше) + проверка ключей + улучшить проверку значений в ответе

#  @id-11.1
#  Структура сценария: Метод «Отправить отчет об использовании (нанесении) КМ» (негативный тест, с отправкой неправильных данных в JSON файле)
#    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
#    Когда выбираем следующие поля JSONа для замены некорректными данными
#      |<Поле>|
#    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | ownerId | mainResp |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | BODY |  | <Jsons> |
#    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
#    Когда выбираем следующие поля JSONа для замены некорректными данными
#      |<Поле>|
#    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | ownerId | mainResp |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | BODY |  | <Jsons> |
#    Когда значение в переменной secondResp и равно 2
#    Примеры:
#      |Jsons|
#      |utilisationReports/utilisationReport1|
#      |utilisationReports/utilisationReport2|
#      |utilisationReports/utilisationReport3|
#      |utilisationReports/utilisationReport4|
#    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
#      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
#      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
#    Когда проверить ответы сервера
#      |response_with_boolean_type_value|<response_with_boolean_type_value>|
#      |response_with_double_type_value |<response_with_double_type_value> |
#      |response_with_int_type_value    |<response_with_int_type_value>    |
#      |response_with_string_type_value |<response_with_string_type_value> |
#      |response_with_null_type_value   |<response_with_null_type_value>   |
#    Примеры:
#      |Поле       |Код null|Код int|Код double|Код string|Код empty string|Код bool|response_with_null_type_value                                                       |response_with_int_type_value                           |response_with_double_type_value                        |response_with_string_type_value                        |response_with_boolean_type_value                       |
#      |orderId    |400     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"orderId: не должно равняться null"}                  |{"errorCode":9991,"errorText":"Заказ 0 не найден"}     |{"errorCode":9991,"errorText":"Заказ 0.0 не найден"}   |{"errorCode":9991,"errorText":"Заказ test не найден"}  |{"errorCode":9991,"errorText":"Заказ false не найден"} |
#      |usageType  |500     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"HV000028: Unexpected exception during isValid call."}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|
#      |sntins.code|500     |400    |400       |400       |400             |400     |{"errorCode":9991,"errorText":"HV000028: Unexpected exception during isValid call."}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|

#    блокер, не верный формат КМ + после фикса бага, прописать правильные ответы и коды ошибок + уточнить с синтаксисом кукумбера в этом случае.

#  @id-11.2
#  Структура сценария: Метод «Отправить отчет об использовании (нанесении) КМ» (негативный тест, проверка данных ответа с неправильным форматом)
#    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
#    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | ownerId | mainResp |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | BODY |  | <Jsons> |
#    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
#    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | ownerId | mainResp |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | BODY |  | <Jsons> |
#    Когда значение в переменной secondResp не равно
#      |<Значение>|
#    Примеры:
#      |Значение|
#      | 12 |
#    Примеры:
#      |Jsons|
#      |utilisationReports/utilisationReport1|
#      |utilisationReports/utilisationReport2|
#      |utilisationReports/utilisationReport3|
#      |utilisationReports/utilisationReport4|
    #    улучшить метод проверки переменной на вэльюсы + уточнить возможность нескольких примеров в одном кейсе(было выше) + при желании добавить метод на перечисление для каждого продукта их джейсона свой cisType и обработать каждый вариант с их ошибками, либо ограничиться каким то одним вариантом для каждого из продуктов
# обсудить, для каждого продукта есть свои обязательные поля и нет, необходимы ли проверки на эти бесконечные количества вариантов и сбора их ошибок

  @id-12
  Структура сценария: Метод «Отправить отчет о валидации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем secondResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда значение в переменной secondResp и равно 2
    Примеры:
      |Jsons|
      |validationReports/validationReport1|
      |validationReports/validationReport2|
#    блокер, разные json-ы, какой формат в итоге верный

  @id-13
  Сценарий: Метод «Отправить отчет об агрегации КМ Типографии»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем secondResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда значение в переменной secondResp и равно 2
#  "errorText": "aggregationUnit: не должно равняться null" хотя в постмане и сваггере все нормально

  @id-14
  Сценарий:	Метод «Получить список заказов КМ по идентификатору производственного заказа»
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Значение из "orderIds" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
    Когда значение в переменной mainResp и равно []
#    Уточнить по поводу пустой строки вместо данных

  @id-15
  Сценарий:	Метод «Получить список отчетов о нанесении КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
    Когда значение в переменной mainResp и равно []
#    Уточнить по поводу пустой строки вместо данных

  @id-16
  Сценарий:	Метод «Получить список отчетов об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
    Когда значение в переменной mainResp и равно []
#    Уточнить по поводу пустой строки вместо данных

  @id-17
  Структура сценария: Метод «Получить список КИ из отчета о нанесении КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем secondResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/cis/list" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: utilisationIgnore
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | secondResp |
    Примеры:
      |Jsons|
      |utilisationReports/utilisationReport1|
      |utilisationReports/utilisationReport2|
      |utilisationReports/utilisationReport3|
      |utilisationReports/utilisationReport4|

#    Блокер, формат КМ не корректный
#    уточнить проверку джэйсонов с игнором вэльюсов для данного случая

  @id-18
  Сценарий:	Метод «Получить список КИ из отчета об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/cis/list" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: aggregationIgnore
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | secondResp |
#    Блокер "errorText": "aggregationUnit: не должно равняться null"
#    уточнить проверку джэйсонов с игнором вэльюсов для данного случая

#  @id-19 НУЖНО, НЕ УДАЛЯТЬ!!!
#  Сценарий:	Метод «Получить код агрегата из отчета об агрегации Типографии по КИ»
#    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/printery/unit" с параметрами из таблицы. Значение из "printeryAggregationUnits.reportId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | cis | 010467834657283921598765 |
#    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
#    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/printery/unit" с параметрами из таблицы. Значение из "printeryAggregationUnits.unitSerialNumber" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | cis | 010467834657283921598765 |
#    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
##    Уточнить как получать cis"
##    уточнить почему в данном случае ответ "aggregationCemUnits": []

  @id-19
  Сценарий:	Метод «Получить код агрегата из отчета об агрегации Типографии по КИ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/printery/unit" с параметрами из таблицы. Значение из "aggregationCemUnits" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | cis | 010467834657283921598765 |
    Когда значение в переменной mainResp и равно []
#  Это второй вариант
#    Уточнить как получать cis"
#    уточнить почему в данном случае ответ "aggregationCemUnits": []

  @id-20
  Сценарий: Метод «Получить коды маркировки из отчета об агрегации КМ Типографии»
    Когда POST запрос выполнен на URL "/api/mcdn/report/aggregation/printery/codes" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: aggregationCodesIgnore
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationPrinteryCodes |

#    переделано под метод POST, проверить правильность
#    блокер, "Указаны параметры индекса и параметры по значению КМ для определения диапазона КМ"
#  {
#  "errorCode": 9991,
#  "errorText": "JSON parse error: Unrecognized token 'aggregationCodesIgnore': was expecting (JSON String, Number, Array, Object or token 'null', 'true' or 'false'); nested exception is com.fasterxml.jackson.core.JsonParseException: Unrecognized token 'aggregationCodesIgnore': was expecting (JSON String, Number, Array, Object or token 'null', 'true' or 'false')\n at [Source: (PushbackInputStream); line: 1, column: 23]"
#  }
