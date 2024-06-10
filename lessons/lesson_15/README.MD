## разворачиваем контейнеры
```make init```

## вносим правки в файл hosts
```sudo nano /etc/hosts```

## добавляем строку
```127.0.0.1 tms.space```

## перезагружаем nginx
```docker exec -i lesson-15-front nginx -s reload```

## открываем браузер
```http://tms.space```

## работаем