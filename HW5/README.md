## Getting started (HW5)

Report for this homework is in the file titled **REPORT.md**.

The source codes for this homework are in this directory (**HW5**).

## About the program

The program has one store in which customers can buy things and proceed to cashiers in order to
check out.

The store has a number of threads to generate (called *generators*) customers with their items and
another couple of threads to take care of checking the products out (called *cashiers*).

The generated customers choose a cashier randomly and go into their queue, where they wait until a
cashier checks their products out. After that, the customer leaves and the cashier either waits for
another customer, or proceeds to the next one if the queue is not empty.

## Launching the program

To launch the program, use this command: ```PROGRAM_NAME [PARAMS]```, where ```PARAMS``` should
either be empty or contain four numbers as follows:

```[CASHIER_COUNT] [GENERATOR_COUNT] [QUEUE_SIZE] [TOTAL_CUSTOMER_COUNT]```

<hr>

```PROGRAM_NAME``` – the executable to run

```CASHIER_COUNT``` – the number of cashiers to use, between 1 and 100

```GENERATOR_COUNT``` – the number of generator threads to use, between 1 and 500

```QUEUE_SIZE```  – the size of the queue for each cashier, between 1 and 1000

```TOTAL_CUSTOMER_COUNT```  – the total number of customers to generate and check out, between 1 and
10000

### Console output

The data about customers and their transactions will be printed into the console.
