# language: ru
@test

Функционал: Описание API Эмиссии КМ

  @id-1
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Значение из "success" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда значение в переменной mainResp и равно true

  @id-2
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "omsId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | <Jsons> |
    Когда значение в переменной mainResp и равно a2a16a41-42b0-4309-9ae1-c19d53cc544f
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | <Jsons> |
    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
    Примеры:
    |Jsons|
    |myJson1|
    |myJson2|
    |myJson3|

  @id-3
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: allOrders
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |

  @id-4
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: orderSecond
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |

  @id-5
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами»
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Значение из "recipientOrderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда значение в переменной mainResp и равно 77f791ed-2d6d-407d-970b-dd4b87377e5e
      #    выполнить проверку ответа с существующими данными

  @id-6
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки»
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: kMOrders
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | 1 |
      | PARAMS | orderId | b9316c13-a71c-4440-a080-fa7260366d32 |

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

  @id-8
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | myJson |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда значение в переменной mainResp и равно 10
#    разобраться со статусом запроса, что не READY

  @id-9
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Значение из "valid" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда значение в переменной mainResp и равно true

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
  @id-21
  Сценарий: Тестирование некорректных данных
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |orderId|aggregationUnits.sntins.code|
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда проверить ответы сервера
      |response_with_boolean_type_value|{"errorCode":9991,"errorText":"Формат КМ некорректный"}|
      |response_with_double_type_value |{"errorCode":9991,"errorText":"Формат КМ некорректный"}|
      |response_with_int_type_value    |{"errorCode":9991,"errorText":"Формат КМ некорректный"}|
      |response_with_String_type_value |{"errorCode":9991,"errorText":"Формат КМ некорректный"}|