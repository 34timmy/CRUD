# Реализация простого CRUD Web приложения.

## Установка приложения

Установить на компьютер [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), [Maven](https://maven.apache.org/) и [MySQL](https://dev.mysql.com/downloads/mysql/).

Параметры БД задать в src\main\resources\application.properties. Пример:
* db.driver=com.mysql.jdbc.Driver
* db.url=jdbc:mysql://localhost:3306/test - адрес подключения к БД
* db.username=root - логин
* db.password=root - пароль

Скрипт для создания таблицы и её наполнения в UserSQL.sql

## Запуск приложения


Открыть приложение в браузере по адресу: http://localhost:8080/MyCRUD2-1.0-SNAPSHOT/list/1
