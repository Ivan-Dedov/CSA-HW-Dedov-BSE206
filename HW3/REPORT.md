# Домашнее задание №3

Дедов Иван Николаевич, БПИ-206

## Описание полученного задания

### Номер варианта

208

### Номер условия

(208 - 1) % 14 + 1 = 12

### Номер дополнительной функции

((208 - 1) / 14) % 25 + 1 = 15

### Полученное условие

| Обобщенный артефакт, используемый в задании | Базовые альтернативы | Общие для всех альтернатив переменные | Общие для
всех альтернатив функции | Обработка данных |
| - | - | - | - | - |
| Животные | 1. Рыбы (место проживания – перечислимый тип: река, море, озеро...) <br/> 2. Птицы (отношение к перелету:
перелетные, остающиеся на зимовку – булевская величина) <br/> 3. Звери (хищники, травоядные, насекомоядные... –
перечислимый тип) | 1. Название – строка символов, <br/> 2. Вес в граммах (целое) | Частное от деления суммы кодов
незашифрованной строки на число символов в этой строке на вес (действительное число) | Упорядочить элементы контейнера
по убыванию используя сортировку с помощью «дерева» (Heap Sort). В качестве ключей для сортировки и других действий
используются результаты функции, общей для всех альтернатив. |

## Структурная схема изучаемой архитектуры ВС с размещенной на ней разработанной программой

### Таблица типов

| Тип данных | Занимаемая память |
| - | - |
| int | зависит от размера числа | 
| float | 24 байт |
| bool | 24 байт |
| str | зависит от длины строки |
| list | пустой список - 56 байт + 8 байт на каждый элемент |
| Animal<sup>i</sup> | 48 байт |
| Bird<sup>ii</sup> | 48 байт |
| Fish<sup>iii</sup> | 48 байт |

<sup>i</sup> В классе Animal содержатся свойства: name (строка), weight (целое число) и food_source (строка). Помимо
этого, есть лист строковых представлений допустимых типов питания животного.

<sup>ii</sup> В классе Bird содержатся свойства: name (строка), weight (целое число) и does_migrate (булевская) -
является птица перелетной или нет.

<sup>iii</sup> В классе Fish содержатся свойства: name (строка), weight (целое число) и habitat (строка). Помимо этого,
есть лист строковых представлений допустимых мест обитания рыбы.

### Глобальная память

Не использутеся.

### Память программы

#### Детальная память методов

##### ```main```
(Это не совсем явный метод - в файле ```main.py``` просто содержится исходный код, который можно запустить. Но из этого кода строится как бы метод main.)

| Переменная | Занимаемая память (в байтах) |
| - | - |
| args: list | 88 (в списке всегда 4 элемента) |
| creatures: list | зависит от количества животных в списке |

| Информация в куче |
| - |
| строки с аргументами командной строки |
| животные из полученного массива |

##### ```get_from_file(filename: str) -> list```

| Переменная | Занимаемая память (в байтах) |
| - | - |
| creatures: list | зависит от количества животных в списке |

| Информация в куче |
| - |
| животные из полученного массива |

##### ```generate_creature(index: int) -> Creature```

| Переменная | Занимаемая память (в байтах) |
| - | - |
| animal_type: int | 24 или 28 (в коде тут может лежать только число 0, 1 или 2) |

| Информация в куче |
| - |
| животное, возвращаемое из метода |

##### ```generate(count: int) -> list```

| Переменная | Занимаемая память (в байтах) |
| - | - |
| creatures: list | зависит от количества элементов |

| Информация в куче |
| - |
| животные из списка |

#### Стек вызовов

Описан в виде дерева, так как вызов некоторых функций зависит от выполнения условий. Если вызов метода зависит от
выполнения условия, то оба варианта сгруппированы (например, ```get_from_file``` и ```generate```).

Описан для случая, когда запускается пакет ```main.py```.

```
main 
│
│
├───get_from_file
│   ├───open()
│   ├───str.split()
│   ├───list.append()
│   └───file.close()
├───generate
│   └───generate_creature
│       └───creatures.generateName
│
│
├───write_to_file
│   ├───open()
│   ├───file.write()
│   ├───creataure.to_string()
│   └───file.close()
│
│
├───heapsort
│   ├──heapify*
│   │   ├───creatures.swap
│   │   └───creatures.heapify*
│   │
│   │
│   └──heapify*
│       ├───creatures.swap
│       └───creatures.heapify*
│
│
└───write_to_file
    ├───open()
    ├───file.write()
    ├───creataure.to_string()
    └───file.close()
```

\* Функция вызывается рекурсивно. Количество вызовов определяется at runtime.

## Требуемые метрики, определяющие характеристики программы, для различных тестовых прогонов

### Число интерфейсных модулей (заголовочных файлов)

0

### Число модулей реализации (файлов с определением программных объектов)

6

### Общий размер исходных текстов

| Файл                    | Размер                     |
| ----------------------- | -------------------------- |
| ```Animal.py```         | 694 байт                   |
| ```Bird.py```           | 483 байт                   |
| ```Creature.py```       | 1 120 байт                 |
| ```Fish.py```           | 623 байт                   |
| ```main.py```           | 1 186 байт                 |
| ```util.py```           | 2 838 байт                 |
| **Всего**               | **6 944 байт ≈ 6.78 Кб**   |

### Полученный размер исполняемого кода (если он формируется)

Исполняемый код не формируется.

### Время выполнения программы для различных тестовых наборов данных:

| Тестовый файл    | Время выполнения |
| ---------------- | ---------------- |
| ```test01.txt``` | 0.003 с          |
| ```test02.txt``` | 0.009 с          |
| ```test03.txt``` | 0.440 с          |
| ```test04.txt``` | 0.002 с          |
| ```test05.txt``` | 0.006 с          |
| ```test06.txt``` | 0.007 с          |
| ```test07.txt``` | 0.005 с          |
| ```test08.txt``` | \*               |
| ```test09.txt``` | \*               |
| ```test10.txt``` | 0.018 с          |

\* В тесте введены некорректные данные. При нахождении первого некорректного набора программа тут же завершается.

## Данные, демонстрирующие сравнение с характеристиками ранее разработанных программ

Динамически типизированный язык Python был придуман ради кардинально отличающейся от предыдущих парадигмы
программирования. Все сущности в программе являются объектами, тип которых обрабатывается если нужно и только во время
исполнения. У языка нет компилятора - только интерпретатор, поэтому, например, нам не обязательно инициализировать
переменную за границами условного блока, чтобы использовать ее после этого блока.

Ввиду этих и других особенностей языка, программы на Python получаются в разы короче и читабельнее, чем на C или С++.
Однако так как все сущности являются объектами и хранятся в куче, так как мы никогда не можем быть уверены, существует
вообще нужная переменная, то на обработку и проверку всего этого уходит большое число ресурсов - как
времени, так и памяти: тесты выполняются медленнее, чем на С или С++.

В отличие от предыдущих работ, в этой работе больше всего неопределенностей: мы не знаем, сколько весит какой объект,
потому что все зависит от того, что в него положить. Это один из недостатков Python и динамической парадигмы в целом -
потеря по скорости и по памяти.

Однако в этом есть и плюсы: Python - очень гибкий и лаконичный язык, на котором можно написать практически что угодно.
В языке можно комбинировать парадигмы: пользоваться объектами (в нашем случае - это классы животных), а также
использовать обособленные методы (у нас они лежат в пакете ```util```). В Python нет ограничений на длину строки, числа,
так как все это определяется и обрабатывается в runtime.