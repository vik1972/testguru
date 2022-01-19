# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Список сущностей
* Автор - создаёт и редактирует тесты
* Пользователь - проходит тесты
* Тест - набор вопросов и связынных с ним ответов, автора создавшего тест
* Вопрос - текст и массив ответов связанных с ним
* Ответ - текст и числовое значени, определяющее количество баллов за выбор этого ответа (value, 
  value=0 означает, что ответ неверный). Связь с автором и пользователем выбравшим этот ответ (для статистики).
* Проверяющая система -  программа, которая обрабатывает ответы и подсчитывает итоговое количество баллов

* List of entities
* Author - creates and edits tests
* User - passes tests
* Test - a set of questions and related answers by the author who created the test
* Question - a text and an array of answers related to it
* Answer - text and numeric value that determines the number of points for choosing this answer (value,
value=0 means that the answer is incorrect). Communication with the author and the user who selected this answer (for statistics).
* Checking system - a program that processes responses and calculates the total number of points