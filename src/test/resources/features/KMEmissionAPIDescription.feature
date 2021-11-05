# language: ru
@test

Функционал: Описание API Эмиссии КМ

  @all @id-1
  Сценарий: Метод «Проверить маркер безопасности»
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Значение из "valid" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда значение в переменной mainResp и равно true

  @all @id-1.1
  Сценарий: Метод «Проверить маркер безопасности» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"checkToken.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-1.2
  Структура сценария: Метод «Проверить маркер безопасности» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/token/check" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | securityMarker |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле |Код null|Код int|Код double|Код string|Код empty string|Код bool|
      |valid|200     |200    |200       |200       |200             |200     |

  @all @id-2
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Значение из "success" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда значение в переменной mainResp0 и равно true

  @all @id-2.1
  Сценарий: Проверка запроса на некорректный эндпоинт
    Когда выполнен GET запрос на URL "/api/abrakadabra" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 404
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда ответ сервера, сохраненный в переменную errorResp равен <html><head><title>Error</title></head><body>Not Found</body></html>

  @all @id-2.2
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос (негативный тест, проверка с использованием некорректных параметров запроса)
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"ping.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-3
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки» с сохранением в файл
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson4 |
    Когда сохраняем параметр orderId из переменной mainResp1 в файл
    Когда сохраняем параметр productionOrderId из переменной mainResp1 в файл

  @all @id-3.0
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки» тесты на проверку параметров заявки
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "omsId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson4 |
    Когда значение в переменной mainResp1 и равно d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson4 |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36

  @all @id-3.1
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, проверка ответов сервера на некорректные типа данных)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/order" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson4 |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле        |Код null   |Код int    |Код double |Код string |Код empty string|Код bool   |
      |cisType     |400,400,400|200,200,200|400,400,400|400,400,400|400, 400, 400   |400,400,400|
      |productGroup|400,400,400|400,400,400|400,400,400|400,400,400|400, 400, 400   |400,400,400|

  @all @id-3.2
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректных параметров запроса)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"createOrder.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | abrakadabra |
      | BODY |  | orderCreation/myJson4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"createOrder.omsId","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-3.3
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с удалением)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и удаленным элементом <field> из JSON файла, ответ сохранить в переменную mainResp0
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson4 |
    Когда проверить коды ответов <code> для JSONов с измененными или удаленными полями в mainResp0
    Когда проверить ответы сервера для JSONов с измененными или удаленными полями в mainResp0
    Примеры:
      |field            |  code       |
      |gtin             |400, 400, 400|
      |quantity         |400, 400, 400|
      |serialNumberType |400, 400, 400|
      |serialNumbers    |200, 200, 200|
      |cisType          |400, 400, 400|
      |releaseMethodType|400, 400, 400|
      |attributes       |200, 200, 200|
      |productGroup     |400, 400, 400|
      |productionOrderId|200, 200, 200|

  @all @id-3.4
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой на некорректные значения)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и значения элементов <field> из JSON файла изменены на <changingValue>, ответ сохранить в переменную mainResp0
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson4 |
    Когда проверить коды ответов <code> для JSONов с измененными или удаленными полями в mainResp0
    Когда проверить ответы сервера для JSONов с измененными или удаленными полями в mainResp0
    Примеры:
      |field            |changingValue|  code |
      |gtin             |      ""     |400, 400, 400|
      |quantity         |      0      |400, 400, 400|
      |serialNumberType |   OPERATOR  |200, 200, 200|
      |serialNumbers    |      ""     |400, 400, 400|
      |cisType          |      ""     |400, 400, 400|
      |releaseMethodType|      ""     |400, 400, 400|
      |attributes       |      ""     |400, 400, 400|
      |productGroup     |      ""     |400, 400, 400|
      |productionOrderId|      ""     |400, 400, 400|

  @all @id-3.5
  Структура сценария: Метод «Создать заявку на эмиссию кодов маркировки» (негативный тест, изменения в JSON файлах с заменой cisType)
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы и значения элементов <field> из JSON файла изменены на <changingValue>, ответ сохранить в переменную mainResp0
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
      | BODY |  | orderCreation/myJson |
    Когда проверить коды ответов <code> для JSONов с измененными или удаленными полями в mainResp0
    Когда проверить ответы сервера для JSONов с измененными или удаленными полями в mainResp0
    Примеры:
      |field    |changingValue|     code    |
      |cisType  |    UNIT     |200, 200, 200|
      |cisType  |    GROUP    |200, 200, 200|
      |cisType  |    SET      |400, 400, 200|

  @all @id-4
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: allOrders
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |

  @all @id-4.1
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок (негативный тест, проверка с использованием некорректных параметров запроса)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderStatus.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-4.2
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок (негативный тест, проверка с использованием некорректного параметра Content-Type)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | affdbfbdfb |
#    уточнить итоговое поведение в данном случае

  @all @id-5
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки
    Когда ожидаем статуса заявки READY
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | file |
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | file |
    Когда сохраняем параметр orderInfos.find{it.orderId == '*'}.productionOrderId из переменной mainResp1 в файл, где * = orderId
    Когда сохраняем параметр orderInfos.find{it.orderId == '*'}.ownerId из переменной mainResp1 в файл, где * = orderId

  @all @id-5.0
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки (позитивный тест, проверка структуры ответа)
    Когда ожидаем статуса заявки READY
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | file |
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: orderSecond
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | file |

  @all @id-5.1
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | PARAMS | orderId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderStatus.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-5.2
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки (негативный тест, проверка с использованием некорректного параметра orderId)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderStatus.orderId","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-6
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (позитивный тест, проверка структуры ответа)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | quantity | 2 |
      | PARAMS | orderId | file |
    Когда сохраняем параметр ownerId из переменной mainResp2 в файл
    Когда сохраняем параметр codes[0] из переменной mainResp2 в файл

  @all @id-6.0
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки»
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: kMOrders
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | quantity | 2 |
      | PARAMS | orderId | file |

  @all @id-6.1
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | PARAMS | quantity | 2 |
      | PARAMS | orderId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderCodes.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-6.2
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра quantity №1)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | quantity | 0 |
      | PARAMS | orderId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderCodes.quantity","fieldError":"должно быть не меньше 1"}],"globalErrors":[],"success":false}

  @all @id-6.3
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра quantity №2)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | quantity | 100001 |
      | PARAMS | orderId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderCodes.quantity","fieldError":"должно быть не больше 100000"}],"globalErrors":[],"success":false}

  @all @id-6.4
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра quantity №3)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | quantity | abrakadabra |
      | PARAMS | orderId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[],"globalErrors":["Failed to convert value of type 'java.lang.String' to required type 'int'; nested exception is java.lang.NumberFormatException: For input string: \"abrakadabra\""],"success":false}

  @all @id-6.5
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра orderId)
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | quantity | 2 |
      | PARAMS | orderId | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderCodes.orderId","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @id-7
  Сценарий: Метод «Отправить отчет об использовании (нанесении) КМ»
    Когда заменяет значение поля orderId в JSON файле utilisationReports/utilisationReport4 на значение из файла orderId
    Когда заменяет значение поля sntins[0].code в JSON файле utilisationReports/utilisationReport4 на значение из файла codes0
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp3 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда сохраняем параметр reportId из переменной mainResp3 в файл

  @all @id-7.0.0
  Сценарий: Метод «Получить статус обработки отчета» (позитивный тест, проверка структуры ответа для отчета об использовании (нанесении) КМ)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда рандомное значение в переменной mainResp2 соответствует формату, длина равна 36
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда значение в переменной mainResp2 и равно SENT_SYSTEM

  @id-7.0
  Сценарий: Метод «Отправить отчет об использовании (нанесении) КМ» (позитивный тест, проверка структуры ответа)
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда значение в переменной mainResp2 и равно 2

  @id-7.1
  Сценарий: Метод «Отправить отчет об использовании (нанесении) КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"sendUtilisationReport.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @id-7.2
  Сценарий: Метод «Отправить отчет об использовании (нанесении) КМ» (негативный тест, проверка с использованием некорректного параметра ownerId)
    Когда выполнен POST запрос на URL "/api/mcdn/report/utilisation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | utilisationReports/utilisationReport4 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[],"globalErrors":["Площадка abracadabra не найдена"],"success":false}

  @id-8
  Сценарий: Метод «Получить список КИ из отчета о нанесении КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/cis/list" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: utilisationIgnore
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | 3c2520e7-7b1c-43d7-aed9-4405cb2595ed |

  @id-8.1
  Сценарий: Метод «Получить список КИ из отчета о нанесении КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/cis/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | reportId | 3c2520e7-7b1c-43d7-aed9-4405cb2595ed |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getCisListFromUtilisationReport.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @id-8.2
  Сценарий: Метод «Получить список КИ из отчета о нанесении КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/cis/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | abracadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getCisListFromUtilisationReport.reportId","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-9
  Структура сценария: Метод «Отправить отчет о валидации КМ»
    Когда заменяет значение поля orderId в JSON файле validationReports/validationReport1 на значение из файла orderId
    Когда заменяет значение поля sntins[0].code в JSON файле validationReports/validationReport1 на значение из файла codes0
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда сохраняем параметр reportId из переменной mainResp4 в файл
    Примеры:
      |Jsons|
      |validationReports/validationReport1|

  @all @id-9.0.0
  Сценарий: Метод «Получить статус обработки отчета» (позитивный тест, проверка структуры ответа для отчета о валидации КМ)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда рандомное значение в переменной mainResp2 соответствует формату, длина равна 36
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда значение в переменной mainResp2 и равно SENT_SYSTEM


  @all @id-9.0
  Структура сценария: Метод «Отправить отчет о валидации КМ» (позитивный тест, проверка структуры ответа)
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда значение в переменной mainResp1 и равно 1
    Примеры:
      |Jsons|
      |validationReports/validationReport1|

  @all @id-9.1
  Структура сценария: Метод «Отправить отчет о валидации КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"sendValidationReport.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}
    Примеры:
      |Jsons|
      |validationReports/validationReport1|

  @all @id-9.2
  Структура сценария: Метод «Отправить отчет о валидации КМ» (негативный тест, проверка с использованием некорректного параметра ownerId)
    Когда выполнен POST запрос на URL "/api/mcdn/report/validation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | <Jsons> |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[],"globalErrors":["Площадка abracadabra не найдена"],"success":false}
    Примеры:
      |Jsons|
      |validationReports/validationReport1|

  @all @id-10
  Сценарий: Метод «Отправить отчет об агрегации КМ»
    Когда заменяет значение поля orderId в JSON файле agregationOrderSending на значение из файла orderId
    Когда выделить части кода из файла codes0 и сохранить в файл cis и codesRight
    Когда заменяет значение поля aggregationUnits[0].sntins[0].code в JSON файле agregationOrderSending на значение из файла cis
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда сохраняем параметр reportId из переменной mainResp4 в файл

  @all @id-10.0.0
  Сценарий: Метод «Получить статус обработки отчета» (позитивный тест, проверка структуры ответа для отчета об агрегации КМ)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда рандомное значение в переменной mainResp2 соответствует формату, длина равна 36
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда значение в переменной mainResp2 и равно SENT_SYSTEM

  @all @id-10.0
  Сценарий: Метод «Отправить отчет об агрегации КМ» (позитивный тест, проверка структуры ответа)
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp3 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда рандомное значение в переменной mainResp3 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда значение в переменной mainResp4 и равно 1

  @all @id-10.1
  Структура сценария: Метод «Отправить отчет об агрегации КМ» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле                            |Код null|Код int|Код double|Код string|Код empty string|Код bool|
      |orderId                         |400     |400    |400       |400       |400             |400     |
      |aggregationUnits.sntins[0].code |500     |400    |400       |400       |400             |400     |
      |aggregationUnits.aggregationType|400     |200    |400       |400       |400             |400     |

  @all @id-10.2
  Сценарий: Метод «Отправить отчет об агрегации КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"sendAggregationReport.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-10.3
  Сценарий: Метод «Отправить отчет об агрегации КМ» (негативный тест, проверка с использованием некорректного параметра ownerId)
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | agregationOrderSending |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[],"globalErrors":["Площадка abracadabra не найдена"],"success":false}

  @id-11
  Сценарий: Метод «Отправить отчет об агрегации КМ Типографии»
    Когда заменяет значение поля orderId в JSON файле aggregationReport на значение из файла orderId
    Когда заменяет значение поля aggregationUnit.sntins[0].code в JSON файле aggregationReport на значение из файла codes0
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда сохраняем параметр reportId из переменной mainResp2 в файл

  @all @id-11.0.0
  Сценарий: Метод «Получить статус обработки отчета» (позитивный тест, проверка структуры ответа)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда рандомное значение в переменной mainResp2 соответствует формату, длина равна 36
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда значение в переменной mainResp2 и равно SENT_SYSTEM

  @id-11.0
  Сценарий: Метод «Отправить отчет об агрегации КМ Типографии» (позитивный тест, проверка структуры ответа)
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда рандомное значение в переменной mainResp0 соответствует формату, длина равна 36
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp3 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда значение в переменной mainResp3 и равно 1

  @all @id-11.1
  Структура сценария: Метод «Отправить отчет об агрегации КМ Типографии» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда проверить коды ответов для замененных значений полей значениями некорректных типов данных
      |null      |целое число|дробное число|пустая строка     |строка      |значение логического типа|
      |<Код null>|<Код int>  |<Код double> |<Код empty string>|<Код string>|<Код bool>               |
    Когда проверить ответы сервера при некорректных отправленных данных
    Примеры:
      |Поле                           |Код null|Код int|Код double|Код string|Код empty string|Код bool|
      |orderId                        |400     |400    |400       |400       |400             |400     |
      |aggregationUnit.sntins[0].code |400     |200    |200       |200       |400             |200     |
      |aggregationUnit.aggregationType|400     |200    |400       |400       |400             |400     |

  @all @id-11.2
  Сценарий: Метод «Отправить отчет об агрегации КМ Типографии» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | ownerId | file |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"sendAggregationCemReport.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-11.3
  Сценарий: Метод «Отправить отчет об агрегации КМ Типографии» (негативный тест, проверка с использованием некорректного параметра ownerId)
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | ownerId | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationReport |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[],"globalErrors":["Площадка abracadabra не найдена"],"success":false}

  @id-12
  Сценарий: Метод «Получить код агрегата из отчета об агрегации Типографии по КИ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/printery/unit" с параметрами из таблицы. Значение из "aggregationCemUnits" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | cis | file |
    Когда значение в переменной mainResp0 соответствует формату

  @all @id-12.1
  Сценарий: Метод «Получить код агрегата из отчета об агрегации Типографии по КИ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/printery/unit" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | cis | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getAggregationCemUnit.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-12.2
  Сценарий: Метод «Получить код агрегата из отчета об агрегации Типографии по КИ» (негативный тест, проверка с использованием некорректного параметра cis)
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/printery/unit" с параметрами из таблицы. Значение из "aggregationCemUnits" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | cis | abracadabra |
    Когда значение в переменной mainResp1 и равно []

  @id-13
  Сценарий: Метод «Получить коды маркировки из отчета об агрегации КМ Типографии»
    Когда заменяет значение поля reportId в JSON файле aggregationPrinteryCodes на значение из файла reportId
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationPrinteryCodes |

  @id-13.0
  Сценарий: Метод «Получить коды маркировки из отчета об агрегации КМ Типографии» (позитивный тест, проверка структуры ответа)
    Когда POST запрос выполнен на URL "/api/mcdn/report/aggregation/printery/codes" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: aggregationPrinteryCodesIgnore
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationPrinteryCodes |

  @id-13.1
  Сценарий: Метод «Получить коды маркировки из отчета об агрегации КМ Типографии» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/report/aggregation/printery/codes" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | aggregationPrinteryCodes |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getCodesFromAggregationCem.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-14
  Сценарий: Метод «Получить статус обработки отчета» (позитивный тест, проверка структуры ответа для отчета об агрегации КМ Типографии)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда рандомное значение в переменной mainResp2 соответствует формату, длина равна 36
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |
    Когда значение в переменной mainResp2 и равно SENT_SYSTEM

  @all @id-14.1
  Сценарий: Метод «Получить статус обработки отчета» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | PARAMS | reportId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getReportStatus.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-14.2
  Сценарий: Метод «Получить статус обработки отчета» (негативный тест, проверка с использованием некорректного параметра reportId)
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | abrakadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getReportStatus.reportId","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-15
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами»
    Когда заменяет значение поля recipientId в JSON файле betweenProviders на значение из файла d1bc2222-7b39-4aa2-afb1-df1b6c8f80c5
    Когда заменяет значение поля orderId в JSON файле betweenProviders на значение из файла orderId
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp2 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда сохраняем параметр recipientOrderId из переменной mainResp2 в файл

  @all @id-15.0
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами» (позитивный тест, проверка структуры ответа)
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Значение из "recipientOrderId" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда рандомное значение в переменной mainResp1 соответствует формату, длина равна 36

  @all @id-15.1
  Структура сценария: Метод «Передача кодов маркировки между сервис-провайдерами» (негативный тест, проверка ответов сервера на некорректные данные)
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
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

  @all @id-15.2
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abrakadabra |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | betweenProviders |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"sendCodes.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-16
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки»
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | mainResp4 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |

  @all @id-16.1
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | orderId | mainResp4 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"closeOrder.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-16.2
  Структура сценария: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, с отправкой неправильных данных в JSON файле)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда выбираем следующие поля JSONа для замены некорректными данными
      |<Поле>|
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с замененными вышеперечисленными полями некорректными данными
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
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

  @all @id-16.3
  Сценарий: Метод «Закрыть заявку на эмиссию кодов маркировки» (негативный тест, попытка закрыть уже закрытый заказ)
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Значение из "orderInfos.find{it.orderStatus == 'READY'}.orderId" присутствует. Ответ сохранить в переменную с именем mainResp4 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Значение из "sntinsCount" присутствует. Ответ сохранить в переменную с именем mainResp3 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | mainResp4 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда выполнен POST запрос на URL "/api/mcdn/order/close" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | orderId | mainResp4 |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | BODY |  | closeOrder |
    Когда ответ сервера, сохраненный в переменную errorResp содержит {"fieldErrors":[],"globalErrors":["Заказ
    Когда ответ сервера, сохраненный в переменную errorResp содержит уже был закрыт"],"success":false}

  @all @id-17
  Сценарий:   Метод «Получить список заказов КМ по идентификатору производственного заказа»
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Значение из "orderIds" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | file |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда значение в переменной mainResp0 соответствует формату

  @all @id-17.1
  Сценарий:   Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | productionOrderId | file |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getOrderList.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-17.2
  Сценарий:   Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Значение из "orderIds" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | abracadabra |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда значение в переменной mainResp0 и равно []

  @all @id-17.3
  Сценарий:   Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/order/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | file |
      | PARAMS | omsId | abracadabra |
    Когда ответ сервера, сохраненный в переменную errorResp содержит {"fieldErrors":[],"globalErrors":["Отсутствует связь эмитента abracadabra с площадкой
    Когда ответ сервера, сохраненный в переменную errorResp содержит ],"success":false}

  @id-18
  Сценарий:   Метод «Получить список отчетов о нанесении КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | file |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда значение в переменной mainResp1 соответствует формату

  @all @id-18.1
  Сценарий:   Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | productionOrderId | file |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getUtilisationReportList.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @id-18.2
  Сценарий:   Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра productionOrderId)
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | abracadabra |
      | PARAMS | omsId | d1bc8149-7b39-4aa2-afb1-df1b6c8f80c5 |
    Когда значение в переменной mainResp0 и равно []

  @all @id-18.3
  Сценарий:   Метод «Получить список заказов КМ по идентификатору производственного заказа» (негативный тест, проверка с использованием некорректного параметра omsId)
    Когда выполнен GET запрос на URL "/api/mcdn/report/utilisation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | file |
      | PARAMS | omsId | abracadabra |
    Когда значение в переменной mainResp1 и равно []

  @id-19
  Сценарий: Метод «Получить список отчетов об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | file |
    Когда значение в переменной mainResp0 соответствует формату

  @id-19.0
  Сценарий: Метод «Получить список отчетов об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/list" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp0 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | file |
    Когда сохраняем параметр reportIds[0] из переменной mainResp0 в файл

  @id-19.1
  Сценарий: Метод «Получить список отчетов об агрегации КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | productionOrderId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getAggregationReportList.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @id-19.2
  Сценарий: Метод «Получить список отчетов об агрегации КМ» (негативный тест, проверка с использованием некорректного параметра productionOrderId)
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/list" с параметрами из таблицы. Значение из "reportIds" присутствует. Ответ сохранить в переменную с именем mainResp1 Ожидаемый код ответа: 200
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | productionOrderId | abracadabra |
    Когда значение в переменной mainResp1 и равно []

  @id-20
  Сценарий: Метод «Получить список КИ из отчета об агрегации КМ»
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/cis/list" с параметрами из таблицы. Ожидаемый код ответа: 200, ожидаемая структура ответа: aggregationIgnore
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | file |

  @id-20.1
  Сценарий: Метод «Получить список КИ из отчета об агрегации КМ» (негативный тест, проверка с использованием некорректного параметра clientToken)
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/cis/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | abracadabra |
      | PARAMS | reportId | file |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getCisListFromAggregationReport.clientToken","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @id-20.2
  Сценарий: Метод «Получить список КИ из отчета об агрегации КМ» (негативный тест, проверка с использованием некорректного параметра reportId)
    Когда выполнен GET запрос на URL "/api/mcdn/report/aggregation/cis/list" с параметрами из таблицы. Ответ сохранить в переменную с именем errorResp Ожидаемый код ответа: 400
      | HEADER | clientToken | d1bc1111-7b39-4aa2-afb1-df1b6c8f80c5 |
      | PARAMS | reportId | abracadabra |
    Когда ответ сервера, сохраненный в переменную errorResp равен {"fieldErrors":[{"fieldName":"getCisListFromAggregationReport.reportId","fieldError":"Значение идентификатора в соответствии с ISO/IEC 9834-8. Не соответствует шаблону [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"}],"globalErrors":[],"success":false}

  @all @del
  Сценарий: удалить все временные файлы
    Когда удаление временных файлов