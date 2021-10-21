# language: ru
@test

Функционал: Описание API Эмиссии КМ

  @id-1
  Сценарий: Метод «Проверить доступность», проверка формата запроса
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |

  @id-2
  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Значение из "success" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
    Когда значение в переменной mainResp и равно true

  @id-3
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки»
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "omsId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | myJson |
    Когда значение в переменной mainResp и равно a2a16a41-42b0-4309-9ae1-c19d53cc544f
    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Значение из "orderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
      | BODY |  | myJson |
    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36

  @id-4
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для всех заявок
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
    И проверяем JSON ответ из переменной совпадает со схемой JSON файла
        #    выполнить проверку ответа

  @id-5
  Сценарий: Метод «Получить статус заявки на эмиссию кодов маркировки» для конкретной завяки
    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | orderId | f3021c64-3174-45c7-9024-15b770fb1357 |
        #    выполнить проверку ответа

  @id-6
  Сценарий: Метод «Передача кодов маркировки между сервис-провайдерами»
    Когда выполнен POST запрос на URL "/api/mcdn/codes/send" с параметрами из таблицы. Значение из "recipientOrderId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | BODY |  | betweenProviders |
    Когда значение в переменной mainResp и равно 77f791ed-2d6d-407d-970b-dd4b87377e5e
      #    выполнить проверку ответа с существующими данными

  @id-7
  Сценарий: Метод «Получить КМ из заявки на эмиссию кодов маркировки»
#    Когда выполнен GET запрос на URL "/api/mcdn/order/status" с параметрами из таблицы. Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | PARAMS | orderId | b9316c13-a71c-4440-a080-fa7260366d32 |
    Когда выполнен GET запрос на URL "/api/mcdn/order/codes" с параметрами из таблицы. Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | quantity | 1 |
      | PARAMS | orderId | b9316c13-a71c-4440-a080-fa7260366d32 |
#    И проверяем JSON ответ из переменной совпадает со схемой JSON файла
        #    выполнить проверку ответа

  @id-8
  Сценарий: Метод «Получить статус обработки отчета»
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportId" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
    Когда значение в переменной mainResp и равно b6ddf431-4296-4ae5-9f4b-198ab92bc4ff
    Когда выполнен GET запрос на URL "/api/mcdn/report/status" с параметрами из таблицы. Значение из "reportStatus" присутствует. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
      | PARAMS | reportId | b6ddf431-4296-4ae5-9f4b-198ab92bc4ff |
    Когда значение в переменной mainResp и равно SENT_SYSTEM


#  @id-3
#  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки»
#    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
#      | BODY |  | myJson |
#    Когда значение из "omsId" присутствует в ответе в переменной mainResp Сохранить в другую переменную saveTitle
#    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. значение из "omsId" сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
#      | BODY |  | myJson |
#    Когда значение в переменной mainResp и равно a2a16a41-42b0-4309-9ae1-c19d53cc544f
#    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
#      | BODY |  | myJson |
#    Когда значение из "orderId" присутствует в ответе в переменной mainResp Сохранить в другую переменную saveTitle
#    Когда выполнен POST запрос на URL "/api/mcdn/order" с параметрами из таблицы. значение из "omsId" сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#      | PARAMS | omsId | a2a16a41-42b0-4309-9ae1-c19d53cc544f |
#      | BODY |  | myJson |
#    Когда рандомное значение в переменной mainResp соответствует формату, длина равна 36
#  @id-2
#  Сценарий: Метод «Проверить доступность», проверка формата ответа на запрос
#    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Ответ сохранить в переменную с именем mainResp Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#    Когда значение из "success" присутствует в ответе в переменной mainResp Сохранить в другую переменную saveTitle
#    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. значение из "success" сохранить в переменную с именем names Ожидаемый код ответа: 200
#      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |
#      | HEADER | Content-Type  | application/json;charset=UTF-8 |
#    Когда значение в переменной names и равно true