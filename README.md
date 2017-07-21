# Реализация простого CRUD Web приложения.

Приложение с поиском по имени и пэйджингом.
Поля:
 * Имя
 * Возраст
 * Является ли пользователь администратором
 * Дата создания записи


## Установка приложения

Установить на компьютер [Tomcat](tomcat.apache.org), [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) и [MySQL](https://dev.mysql.com/downloads/mysql/).

Параметры БД задать в src\main\resources\application.properties. Пример:
* db.driver=com.mysql.jdbc.Driver
* db.url=jdbc:mysql://localhost:3306/test - адрес подключения к БД
* db.username=root - логин
* db.password=root - пароль

Скрипт для создания таблицы и её наполнения в UserSQL.sql

## Запуск приложения

1) Скопировать в ../tomcat/webapps: папку target/crud-1 и target/crud-1.war
2) Запустить Tomcat
Открыть приложение в браузере по адресу: http://localhost:8080/crud-1/list/1
