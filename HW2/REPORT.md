# Домашнее задание №2
Дедов Иван Николаевич, БПИ-206


## Описание полученного задания

### Номер варианта
208

### Номер условия
(208 - 1) % 14 + 1 = 12

### Номер дополнительной функции
((208 - 1) / 14) % 25 + 1 = 15

### Полученное условие
| Обобщенный артефакт, используемый в задании | Базовые альтернативы | Общие для всех альтернатив переменные | Общие для всех альтернатив функции | Обработка данных |
| - | - | - | - | - |
| Животные | 1. Рыбы (место проживания – перечислимый тип: река, море, озеро...) <br/> 2. Птицы (отношение к перелету: перелетные, остающиеся на зимовку – булевская величина) <br/> 3. Звери (хищники, травоядные, насекомоядные... – перечислимый тип) | 1. Название – строка символов, <br/> 2. Вес в граммах (целое) | Частное от деления суммы кодов незашифрованной строки на число символов в этой строке на вес (действительное число) | Упорядочить элементы контейнера по убыванию используя сортировку с помощью «дерева» (Heap Sort). В качестве ключей для сортировки и других действий используются результаты функции, общей для всех альтернатив. |


## Структурная схема изучаемой архитектуры ВС с размещенной на ней разработанной программой

### Таблица типов
| Тип данных | Занимаемая память (в байтах) \[индекс в памяти\] |
| - | - |
| int | 4 |
| char | 1 |
| string | 28 |
| **class Creature** { <br/>&nbsp;&nbsp;&nbsp;&nbsp;name_: std::string<br/>&nbsp;&nbsp;&nbsp;&nbsp;weight_: int<br/> } | 24 \[0\]<br/>4 \[24\]<br/> |
| **class Animal : public Creature** { <br/>&nbsp;&nbsp;&nbsp;&nbsp;name_: std::string<br/>&nbsp;&nbsp;&nbsp;&nbsp;weight_: int<br/>&nbsp;&nbsp;&nbsp;&nbsp;foodSource_ : enum FoodSource<br/>&nbsp;&nbsp;&nbsp;&nbsp;food_source_names_: static const char\*\[\] <br/> } | 24 \[0\]<br/>4 \[24\]<br/>4 \[28\]<br/><br/> |
| **class Bird : public Creature** { <br/>&nbsp;&nbsp;&nbsp;&nbsp;name_: std::string<br/>&nbsp;&nbsp;&nbsp;&nbsp;weight_: int<br/>&nbsp;&nbsp;&nbsp;&nbsp;doesMigrate_ : bool<br/> } | 24 \[0\]<br/>4 \[24\]<br/>1 \[28\]<br/><br/> |
| **class Fish : public Creature** { <br/>&nbsp;&nbsp;&nbsp;&nbsp;name_: std::string<br/>&nbsp;&nbsp;&nbsp;&nbsp;weight_: int<br/>&nbsp;&nbsp;&nbsp;&nbsp;habitat_ : enum Habitat<br/>&nbsp;&nbsp;&nbsp;&nbsp;food_source_names_: static const char\*\[\] <br/> } | 24 \[0\]<br/>4 \[24\]<br/>4 \[28\]<br/><br/> |
| **class CreatureArray** { <br/>&nbsp;&nbsp;&nbsp;&nbsp;data_: Creature\*\*<br/>&nbsp;&nbsp;&nbsp;&nbsp;size_: int <br/>&nbsp;&nbsp;&nbsp;&nbsp;kMaxSize: static const int <br/> } | 4 \[0\] <br/> 4 \[4\] <br/> 4 \[8\] <br/> |


### Глобальная память
Не используется.

### Память программы

#### Детальная память методов

##### ```main(int argc, char **argv)```

| Переменная | Занимаемая память (в байтах) \[индекс в памяти\] |
| - | - |
| argc: int | 4 \[0\] |
| argv: char** | 8 \[4\] |
| creatures: CreatureArray | 12 \[12\] |
| number_of_elements: int | 4 \[24\] |

| Информация в куче |
| - |
| "-f" |
| "input.txt" |
| "output.txt" |
| creatures (экземпляр класса **CreatureArray**) |
| Элементы, хранящиеся в массиве **data_** экземпляра класса **CreatureArray** |

#### Стек вызовов

Описан в виде дерева, так как вызов некоторых функций зависит от выполнения условий. Если вызов метода зависит от выполнения условия, то оба варианта сгруппированы (например, ```creatures.fillFromFile``` и ```creatures.generateRandomly```).

```
main 
│
│
├───creatures.fillFromFile
├───creatures.generateRandomly
│   └───creatures.generateCreature
│       └───creatures.generateName
│
│
├───creatures.printToStd
│   └───creature.toString
│
│
├───creatures.printToFile
│   └───creature.toString
│
│
├───creatures.heapSortDescending
│   ├───creatures.heapify
│   │   ├───creatures.swap
│   │   └───creatures.heapify*
│   │
│   ├───creatures.swap
│   └───creatures.heapify*
│
│
├───creatures.printToStd
│   └───creature.toString
│
│
└───creatures.printToFile
    └───creature.toString
```

\* Функция вызывается рекурсивно. Количество вызовов определяется at runtime.

## Требуемые метрики, определяющие характеристики программы, для различных тестовых прогонов

### Число интерфейсных модулей (заголовочных файлов)
7

### Число модулей реализации (файлов с определением программных объектов)
6

### Общий размер исходных текстов
| Файл                    | Размер                     |
| ----------------------- | -------------------------- |
| ```Animal.h```          | 951 байт                   |
| ```Animal.cpp```        | 585 байт                   |
| ```Bird.h```            | 670 байт                   |
| ```Bird.cpp```          | 530 байт                   |
| ```Creature.h```        | 2 111 байт                 |
| ```Creature.cpp```      | 689 байт                   |
| ```CreatureArray.h```   | 2 439 байт                 |
| ```CreatureArray.cpp``` | 5 837 байт                 |
| ```Fish.h```            | 876 байт                   |
| ```Fish.cpp```          | 482 байт                   |
| ```FoodSource.h```      | 249 байт                   |
| ```Habitat.h```         | 195 байт                   |
| ```main.cpp```          | 2 298 байт                 |
| **Всего**               | **17 912 байт ≈ 17.49 Кб** |

### Полученный размер исполняемого кода (если он формируется)
135 680 байт = 132.5 Кб

### Время выполнения программы для различных тестовых наборов данных:
| Тестовый файл    | Время выполнения |
| ---------------- | ---------------- |
| ```test01.txt``` | 0.045 с          |
| ```test02.txt``` | 0.056 с          |
| ```test03.txt``` | 6.766 с          |
| ```test04.txt``` | \*               |
| ```test05.txt``` | 0.003 с          |
| ```test06.txt``` | 0.038 с          |
| ```test07.txt``` | \*               |
| ```test08.txt``` | \*               |
| ```test09.txt``` | \*               |
| ```test10.txt``` | 0.799 с          |

\* В тесте введены некорректные данные. При нахождении первого некорректного набора программа тут же завершается.


## Данные, демонстрирующие сравнение с характеристиками ранее разработанных программ

???
