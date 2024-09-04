## Задание к уроку "Идиомы Ruby и хороший стиль"

Задание:
- Просмотреть код своего проекта и попробовать применить рассмотренные идиомы там, где это возможно.
- Изучить Ruby Style Guide (ссылка в материалах к уроку). Рекомендую знакомиться с английским вариантом, а русский использовать только для непонятных мест. Английский вариант наиболее актуальный, кроме того, в русском есть неточности.
- Посмотреть мастер-класс "Почему код должен быть стильным" (ссылка в материалах к уроку)
- Установить rubocop и проанализировать свой проект с его помощью
- Исправить все ошибки (кроме отсутствия документации), которые выдаст rubocop. То, что он не сможет исправить в автоматическом режиме, исправить вручную. Залить исправленные версии на гитхаб.


Offenses:
main.rb:8:1: C: Metrics/ClassLength: Class has too many lines. [208/100]
class Railroad ...
^^^^^^^^^^^^^^
main.rb:41:3: C: Metrics/MethodLength: Method has too many lines. [16/10]
  def create_train ...
  ^^^^^^^^^^^^^^^^
main.rb:81:3: C: Metrics/MethodLength: Method has too many lines. [16/10]
  def add_carriages_to_train ...
  ^^^^^^^^^^^^^^^^^^^^^^^^^^
main.rb:108:3: C: Metrics/MethodLength: Method has too many lines. [16/10]
  def occupy_carriage ...
  ^^^^^^^^^^^^^^^^^^^
main.rb:142:3: C: Metrics/MethodLength: Method has too many lines. [11/10]
  def move_train ...
  ^^^^^^^^^^^^^^
main.rb:218:3: C: Metrics/MethodLength: Method has too many lines. [16/10]
  def carriages_list(train) ...
  ^^^^^^^^^^^^^^^^^^^^^^^^^
train.rb:11:3: C: Style/ClassVars: Replace class var @@all with a class instance var.
  @@all = []