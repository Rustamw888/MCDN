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
  Сценарий: Метод «Создать заявку на эмиссию кодов маркировки»
    Когда выполнен GET запрос на URL "/api/mcdn/ping" с параметрами из таблицы. Ожидаемый код ответа: 200
      | HEADER | clientToken | 123fdb5c-c6bd-4a5f-81ab-6230668d9cdd |


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