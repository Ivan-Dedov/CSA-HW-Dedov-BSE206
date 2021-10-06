## Getting started (HW1)

Report for this homework is in the file titled **REPORT.md**.

The source codes for this homework are in this directory (**HW1**).

The test files are in the folder titled **tests**.

The results of these tests are in the folder titled **outputs**. Notice that there are some absent files, since the program does not generate a file for an incorrect input.



## Launching the program

To launch the program, use this command: ```PROGRAM_NAME <TAG>```
and one of these tags:

```-f <INPUT_FILE> <OUTPUT_FILE>```

```-r <NUMBER_OF_ELEMENTS> <OUTPUT_FILE>```

<hr>

```PROGRAM_NAME``` – the executable to run

```INPUT_FILE``` – the file from which to take the data

```NUMBER_OF_ELEMENTS``` – the number of creatures to generate randomly (integer, between 0 and 10 000)

```OUTPUT_FILE```  – the file where to store the sorted data

<hr>

**FYI:**

* ```-f``` stands for **file**, so the program takes the inputs from the specified file

* ```-r``` stands for **random**, so the program generates the input data randomly


## Data input

### Reading from the input file

Every creature (i.e. row inside the ```INPUT_FILE```) has to have this format: ```NAME WEIGHT CREATURE_TYPE SPECIFICATIONS```

```NAME``` – the name of the creature (cannot contain spaces)

```WEIGHT``` – the weight of the creature in grams (integer, from 1 to 2147483647)

```CREATURE_TYPE``` – the type of the creature in this row:
* **1** for ```ANIMAL```
* **2** for ```BIRD```
* **3** for ```FISH```

```SPECIFICATIONS``` – the specific data about the creature (that differs according to the ```CREATURE_TYPE```)

* for ```ANIMAL```:

    ```FOOD_SOURCE``` – the type of food the animal needs
  * **1** for ```CARNIVORE```
  * **2** for ```HERBIVORE```
  * **3** for ```INSECTIVORE```
  * **4** for ```OMNIVORE```

* for ```BIRD```:

  ```DOES_MIGRATE``` – stores whether the bird is migratory or not
  * **0** for ```FALSE```
  * **anything else** for ```TRUE```

* for ```FISH```:

  ```HABITAT``` – the habitat of the fish
  * **1** for ```LAKE```
  * **2** for ```RIVER```
  * **3** for ```SEA```

#### Example
For instance, if we encounter the line

```my_creature 15 1 3```,

then we interpret it as follows:
* an ```ANIMAL``` (since the third parameter is **1**)
* by the name of **my_creature** (taking the first parameter)
* that weighs **15** grams (taking the second parameter)
* and it is an ```INSECTIVORE``` (since the last parameter is **3**)

**Notice!** If the format of the input is incorrect, the output to the file may be aborted. For instance, an empty input file (with 0 creatures) will not produce any output files.

### Creating randomized data

To fill an array with random creatures, use the ```-r``` tag when launching the program. This will generate the creatures randomly, sort them and write the data into the output file.

Provide the program with the number of creatures to create and the file in which to write the data.


## Interpreting the output

The output is printed into the console, as well as the specified file (the one you put as the ```OUTPUT_FILE``` parameter).

### Console output

The given data (or the generated data if you have used ```-r```), the sorted data and all error messages get printed into the console.

### File output

The file data gets generated if the input is correct and everything went right during execution. The file contains the original data (unsorted) with the number of elements inside the dataset, then, after a blank line, contains the sorted data.
