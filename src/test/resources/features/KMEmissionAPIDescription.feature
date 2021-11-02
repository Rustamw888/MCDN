# language: ru
@test

Функционал: Описание API Эмиссии КМ

  @all @id-1
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Значение из "success" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда значение в переменной mainResp0 и равно true

  @all @id-1.1
  Сценарий: Проверка запроса на некорректный эндпоинт
    Когда выполнен GET запрос на URL "/api/abrakadabra" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 404
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда ответ сервера, сохраненный в переменную errorResp равен <html><head><title>Error</title></head><body>Not Found</body></html>

  @all @id-1.2
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос (негативный тест, проверка с использованием некорректных параметров запроса)
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"ping.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-2
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки» с сохранением в файл
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson |
    Когда сохраняем параметр orderId из переменной mainResp1 в файл

  @all @id-2.0
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки» тесты на проверку параметров заявки
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "omsId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда значение в переменной mainResp1 и равно a2a16a41-42b0-4309-9ae1-c19d53cc544f
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36

  @all @id-2.1
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, проверка ответов сервера на некорректные типа данных)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/order" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
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

  @all @id-2.2
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректных параметров запроса)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"createOrder.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | abrakadabra |
      | BODY |  | orderCreation/myJson4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"createOrder.omsId: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-2.3
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с удалением)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и удаленным элементом <field> из JSON файла, ответ сохранить в переменную mainResp0
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда проверить коды ответов <code> для JSONов с измененными или удаленными полями в mainResp0
    Когда проверить ответы сервера для JSONов с измененными или удаленными полями в mainResp0
    Примеры:
      |field            |  code       |
      |gtin             |400, 400, 400|
      |quantity         |400, 400, 400|
      |serialNumberType |400, 400, 400|
      |serialNumbers    |400, 400, 400|
      |cisType          |400, 400, 400|
      |releaseMethodType|400, 400, 400|
      |attributes       |200, 200, 200|
      |productGroup     |400, 400, 400|
      |productionOrderId|200, 200, 200|

  @all @id-2.4
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой на некорректные значения)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и значения элементов <field> из JSON файла изменены на <changingValue>, ответ сохранить в переменную mainResp0
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда проверить коды ответов <code> для JSONов с измененными или удаленными полями в mainResp0
    Когда проверить ответы сервера для JSONов с измененными или удаленными полями в mainResp0
    Примеры:
      |field            |changingValue|  code |
      |gtin             |      ""     |400, 400, 400|
      |quantity         |      0      |400, 400, 400|
      |serialNumberType |   OPERATOR  |400, 400, 400|
      |serialNumbers    |      ""     |400, 400, 400|
      |cisType          |      ""     |400, 400, 400|
      |releaseMethodType|      ""     |400, 400, 400|
      |attributes       |      ""     |400, 400, 400|
      |productGroup     |      ""     |400, 400, 400|
      |productionOrderId|      ""     |400, 400, 400|

  @all @id-2.5
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой cisType)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и значения элементов <field> из JSON файла изменены на <changingValue>, ответ сохранить в переменную mainResp0
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | orderCreation/myJson |
    Когда проверить коды ответов <code> для JSONов с измененными или удаленными полями в mainResp0
    Когда проверить ответы сервера для JSONов с измененными или удаленными полями в mainResp0
    Примеры:
      |field    |changingValue|     code    |
      |cisType  |    UNIT     |200, 200, 200|
      |cisType  |    GROUP    |200, 200, 200|
      |cisType  |    SET      |400, 400, 200|

  @all @id-3
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: allOrders
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |

  @all @id-3.1
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок (негативный тест, проверка с использованием некорректных параметров запроса)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderStatus.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-3.2
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок (негативный тест, проверка с использованием некорректного параметра Content-Type)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | affdbfbdfb |
#    уточнить итоговое поведение в данном случае

  @all @id-4
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки
#    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: orderSecond
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | f9bd9419-bb86-48cc-a6ca-d457019c185c |

  @all @id-4.1
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderStatus.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-4.2
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки (негативный тест, проверка с использованием некорректного параметра orderId)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderStatus.orderId: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-5
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами»
    Когда выполнен POST запрос на URL "http://194.195.240.115:40000/api/mcdn/codes/send" с параметрами из таблицы. Значение из "recipientOrderId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36

  @all @id-5.1
  Структура сценария: Метод «Передача кодов маркировки между сервис-провайдерами» (негативный тест, проверка ответов сервера на некорректные данные)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле       |Код null|Код int|Код double|Код string|Код empty string|Код bool|
      |orderId    |400     |400    |400       |400       |400             |400     |
      |quantity   |400     |400    |400       |400       |400             |400     |
      |recipientId|400     |400    |400       |400       |400             |400     |

  @all @id-5.2
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"sendCodes.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-6
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: kMOrders
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | 1 |
      | PARAMS | orderId | mainResp4 |

  @all @id-6.1
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | PARAMS | quantity | 1 |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderCodes.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-6.2
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра quantity №1)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | 0 |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderCodes.quantity: должно быть не меньше 1"}

  @all @id-6.3
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра quantity №2)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | 100001 |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderCodes.quantity: должно быть не больше 100000"}

  @all @id-6.4
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра quantity №3)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | abrakadabra |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"typeMismatch: Failed to convert value of type 'java.lang.String' to required type 'int'; nested exception is java.lang.NumberFormatException: For input string: \"abrakadabra\""}

  @all @id-6.5
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра orderId)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | 1 |
      | PARAMS | orderId | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderCodes.orderId: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-7
  Сценарий: Метод «Получить статус обработки отчета»
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
    Когда значение в переменной mainResp2 и равно b6ddf431-4296-4ae5-9f4b-198ab92bc4ff
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
    Когда значение в переменной mainResp2 и равно SENT_SYSTEM

  @all @id-7.1
  Сценарий: Метод «Получить статус обработки отчета» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getReportStatus.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-7.2
  Сценарий: Метод «Получить статус обработки отчета» (негативный тест, проверка с использованием некорректного параметра reportId)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getReportStatus.reportId: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-8
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | mainResp4 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |

  @all @id-8.1
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | orderId | mainResp4 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"closeOrder.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-8.2
  Структура сценария: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | mainResp4 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле       |Код null|Код int|Код double |Код string |Код empty string|Код bool|
      |sntinsCount|  200   |  400  |    400    |    400    |      400       |   400  |

  @all @id-9
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Значение из "valid" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда значение в переменной mainResp и равно true

  @all @id-9.1
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"checkToken.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-9.2
  Структура сценария: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле |Код null|Код int|Код double|Код string|Код empty string|Код bool|
      |valid|200     |200    |200       |200       |200             |200     |

  @all @id-10
  Сценарий: Метод «Отправить отчет об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp3 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда рандомное значение в переменной mainResp3 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда значение в переменной mainResp4 и равно 2

  @all @id-10.1
  Структура сценария: Метод «Отправить отчет об агрегации КМ» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
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
      |aggregationUnits.aggregationType|400     |400    |400       |400       |400             |400     |

  @all @id-10.2
  Сценарий: Метод «Отправить отчет об агрегации КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"sendAggregationReport.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @id-11
  Сценарий: Метод «Отправить отчет об использовании (нанесении) КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | 4c0c8613-1fc5-4436-a710-d3a095cc8260 |
    Когда выполнен POST запрос на URL "http://194.195.240.115:40000/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда значение в переменной mainResp2 и равно 2

  @id-11.1
  Сценарий: Метод «Отправить отчет об использовании (нанесении) КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | 4c0c8613-1fc5-4436-a710-d3a095cc8260 |
    Когда выполнен POST запрос на URL "http://194.195.240.115:40000/api/mcdn/report/utilisation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"sendUtilisationReport.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @id-11.2
  Сценарий: Метод «Отправить отчет об использовании (нанесении) КМ» (негативный тест, проверка с использованием некорректного параметра ownerId)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | 4c0c8613-1fc5-4436-a710-d3a095cc8260 |
    Когда выполнен POST запрос на URL "http://194.195.240.115:40000/api/mcdn/report/utilisation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"Площадка abracadabra не найдена"}

  @all @id-12
  Структура сценария: Метод «Отправить отчет о валидации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда значение в переменной mainResp2 и равно 2
    Примеры:
      |Jsons|
      |validationReports/validationReport1|
      |validationReports/validationReport2|

  @all @id-12.1
  Структура сценария: Метод «Отправить отчет о валидации КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"sendValidationReport.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}
    Примеры:
      |Jsons|
      |validationReports/validationReport1|
      |validationReports/validationReport2|

  @all @id-12.2
  Структура сценария: Метод «Отправить отчет о валидации КМ» (негативный тест, проверка с использованием некорректного параметра ownerId)
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"Площадка abracadabra не найдена"}
    Примеры:
      |Jsons|
      |validationReports/validationReport1|
      |validationReports/validationReport2|

  @id-13
  Сценарий: Метод «Отправить отчет об агрегации КМ Типографии»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда рандомное значение в переменной mainResp0 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp3 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда значение в переменной mainResp3 и равно 2
#  "errorText": "aggregationUnit: не должно равняться null" хотя в постмане и сваггере все нормально

  @all @id-14
  Сценарий:	Метод «Получить список заказов КМ по идентификатору производственного заказа»
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Значение из "orderIds" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | 123456 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
    Когда значение в переменной mainResp0 соответствует формату

  @all @id-14.1
  Сценарий:	Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | productionOrderId | 123456 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"getOrderList.clientToken: Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}

  @all @id-14.2
  Сценарий:	Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Значение из "orderIds" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | abracadabra |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
    Когда значение в переменной mainResp0 и равно []

  @all @id-14.3
  Сценарий:	Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | 123456 |
      | PARAMS | omsId | abracadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"errorCode":9991,"errorText":"Отсутствует связь эмитента abracadabra с площадкой 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd"}

  @id-15
  Сценарий:	Метод «Получить список отчетов о нанесении КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | 123456 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
#      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
#    Когда значение в переменной mainResp0 и равно []
#    Уточнить по поводу пустой строки вместо данных

  @id-16
  Сценарий:	Метод «Получить список отчетов об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | productionOrderId | 123456 |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
    Когда значение в переменной mainResp0 и равно []
#    Уточнить по поводу пустой строки вместо данных

  @id-17
  Структура сценария: Метод «Получить список КИ из отчета о нанесении КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp3 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/cis/list" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: utilisationIgnore
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | mainResp3 |
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
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.ownerId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | dd3bb528-22f7-4e2b-a460-5513e5c75f34 |
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | ownerId | mainResp0 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
#    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/cis/list" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: aggregationIgnore
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | reportId | mainResp1 |
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
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/printery/unit" с параметрами из таблицы. Значение из "aggregationCemUnits" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | cis | 010467834657283921598765 |
    Когда значение в переменной mainResp0 и равно []
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
