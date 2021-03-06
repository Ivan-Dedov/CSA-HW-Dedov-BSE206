# Домашнее задание №5

Дедов Иван Николаевич, БПИ-206

## Описание полученного задания

### Номер варианта

8

### Полученное условие

**Задача о супермаркете.** В супермаркете работают два кассира, покупатели заходят в супермаркет,
делают покупки и становятся в очередь к случайному кассиру. Пока очередь пуста, кассир спит, как
только появляется покупатель, кассир просыпается. Покупатель спит в очереди, пока не подойдет к
кассиру. Создать многопоточное приложение, моделирующее рабочий день супермаркета.

### Описание реализации

На один супермаркет приходится несколько потоков для генерации покупателей (это число задается
вторым параметром командной строки, по умолчанию - 3).

Эти потоки генерируют покупателей, которые случайным образом выбирают очередь, в которую они
встанут. Число кассиров задается первым параметром командной строки (по умолчанию - 2).

Кассиры обслуживают некоторое число покупателей (задается четвертым параметром в командной строке,
по умолчанию - 10), после чего программа завершается.

### Описание используемой модели

Для решения поставленной задачи используется модель "Producer - Consumer". Потоки-производители
(*generators*, в нашем случае) создают какие-то объекты и кладут их в общий буфер (в нашем случае,
вектор очередей - по одной очереди на кассира) ограниченного размера (количество покупателей в одной
очереди задается третьим параметром командной строки, по умолчанию - 5).

При наличии каких-либо объектов в буфере, потоки-потребители (в нашем случае, *кассиры*) забирают из
них один объект и обрабатывают его (обслуживают посетителя). Если объектов в потоке нет, то
кассиры "спят", и как только новый объект появляется, они просыпаются и обрабатывают его.

Для контролирования размера очереди (нашего буфера) используется механизм семафоров, которые
позволяют положить элемент в буфер, если там достаточно места и заставляют поток ждать, если места в
буфере нет, и как только оно появляется, производитель кладет свои данные в буфер.

Для недопущения race conditions используются mutex-объекты, которые позволяют получать доступ к
блоку кода внутри lock..unlock только одному потоку.

**NB!** На "покупки" у посетителя и на "обслуживание" у кассира уходит некоторое время. Это
реализовано функцией ```usleep```, усыпляющей поток на некоторое количество микросекунд (в нашем
случае, от 1 до 5 с).

#### Материалы по теме

Более подробную информацию о том, как работают эти методы и используемые приемы можно найти здесь:

* https://www.youtube.com/watch?v=l6zkaJFjUbM
* https://www.youtube.com/watch?v=QMNtAFZtFMA
