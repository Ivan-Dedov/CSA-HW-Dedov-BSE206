#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>


/**
 * The maximum number of elements in the array.
 */
#define MAX_NUMBER_OF_ELEMENTS 10000


/**
 * Defines the ANIMAL subtype of creatures.
 * Contains the animal's food source
 * (enum of 4 values: 1 for CARNIVORE, 2 for HERBIVORE, 3 for INSECTIVORE, 4 for OMNIVORE).
 */
typedef struct animal {
    enum food_source {
        CARNIVORE = 1,
        HERBIVORE = 2,
        INSECTIVORE = 3,
        OMNIVORE = 4
    } food_source;
} animal;

/**
 * Defines the BIRD subtype of creatures.
 * Contains a value to store whether the bird migrates or not
 * (0 for FALSE, anything else for TRUE).
 */
typedef struct bird {
    int does_migrate;
} bird;

/**
* Defines the FISH subtype of creatures.
* Contains the fish's habitat (enum of 3 values: 1 for LAKE, 2 for RIVER, 3 for SEA).
*/
typedef struct fish {
    enum habitat {
        LAKE = 1,
        RIVER = 2,
        SEA = 3
    } habitat;
} fish;

/**
 * Base class for all CREATURES.
 * Contains a name (a char array of length 64),
 * a positive weight,
 * a creature type field (1 for ANIMAL, 2 for BIRD, 3 for FISH),
 * and a union struct "specification" to store different types of creatures.
 */
typedef struct creature {
    char name[64];
    int weight;

    int creature_type;
    union creature_type {
        animal animal;
        bird bird;
        fish fish;
    } specification;
} creature;

float get_creature_metric(creature *creature) {
  char *name = (*creature).name;
  size_t name_length = strlen(name);

  float name_char_sum = 0;
  for (size_t i = 0; i < name_length; ++i) {
    name_char_sum += (int) name[ i ];
  }

  return name_char_sum / (*creature).weight;
}

int compare(creature *creature1, creature *creature2) {
  float metric1 = get_creature_metric(creature1);
  float metric2 = get_creature_metric(creature2);

  if (metric1 < metric2) {
    return -1;
  }
  if (metric1 > metric2) {
    return 1;
  }
  return 0;
}


void copy(creature *target, creature *destination) {
  // Copying the name char by char.
  size_t name_length = strlen((*target).name);
  for (size_t i = 0; i < name_length; ++i) {
    (*destination).name[ i ] = (*target).name[ i ];
  }
  (*destination).name[ name_length ] = '\0';

  // Copying everything else (since we don't want to copy references).
  (*destination).weight = (*target).weight;
  (*destination).creature_type = (*target).creature_type;
  (*destination).specification.animal.food_source = (*target).specification.animal.food_source;
  (*destination).specification.bird.does_migrate = (*target).specification.bird.does_migrate;
  (*destination).specification.fish.habitat = (*target).specification.fish.habitat;
}


void get_creature_name(char *name, int index) {
  char number[5];
  sprintf(number, "%d", index);
  for (int i = 0; i < 5; ++i) {
    name[ i ] = number[ i ];
  }
}


creature generate_creature(int index) {
  // Boundary values for each of the fields of the creature struct.
  int weight_lower_bound = 1, weight_upper_bound = 1000;
  int creature_type_lower_bound = 1, creature_type_upper_bound = 3;
  int food_source_lower_bound = 1, food_source_upper_bound = 4;
  int does_migrate_lower_bound = 0, does_migrate_upper_bound = 1;
  int habitat_lower_bound = 1, habitat_upper_bound = 3;

  creature creature;

  // Generating the name.
  get_creature_name(creature.name, index);
  // Generating the weight.
  creature.weight = rand() % (weight_upper_bound - weight_lower_bound + 1)
    + weight_lower_bound;
  // Generating the creature type (i.e. animal, bird or fish).
  creature.creature_type = rand() % (creature_type_upper_bound - creature_type_lower_bound + 1)
    + creature_type_lower_bound;

  // Depending on the generated type, generating either the food source,
  // the migratory value or the habitat.
  int food_source, does_migrate, habitat;
  switch (creature.creature_type) {
    case 1: // Animal (food source).
      food_source = rand() % (food_source_upper_bound - food_source_lower_bound + 1)
        + food_source_lower_bound;
      creature.specification.animal.food_source = food_source;
      break;

    case 2: // Bird (is migratory or not).
      does_migrate = rand() % (does_migrate_upper_bound - does_migrate_lower_bound + 1)
        + does_migrate_lower_bound;
      creature.specification.bird.does_migrate = does_migrate;
      break;

    case 3: // Fish (habitat).
      habitat = rand() % (habitat_upper_bound - habitat_lower_bound + 1)
        + habitat_lower_bound;
      creature.specification.fish.habitat = habitat;
      break;

      // Default is unnecessary: cannot generate an out-of-bounds value for creature type.
  }

  return creature;
}


void print_creature_to_file(FILE *file, creature *creature, int index) {
  // Printing the creature data into the file according to the creature's type.
  switch ((*creature).creature_type) {
    case 1: // Animal.
      fprintf(file, "ANIMAL { name = \"%s\", weight = %d, ",
              (*creature).name,
              (*creature).weight);

      // Printing the food source of the animal.
      switch ((*creature).specification.animal.food_source) {
        case 1:
          fprintf(file, "food_source = CARNIVORE }\n");
          break;
        case 2:
          fprintf(file, "food_source = HERBIVORE }\n");
          break;
        case 3:
          fprintf(file, "food_source = INSECTIVORE }\n");
          break;
        case 4:
          fprintf(file, "food_source = OMNIVORE }\n");
          break;
        default:
          printf("Unknown food source of animal at index %d: %d.\n",
                 index,
                 (*creature).specification.animal.food_source);
          exit(-4);
      }
      break;

    case 2: // Bird.
      fprintf(file, "BIRD { name = \"%s\", weight = %d, ",
              (*creature).name,
              (*creature).weight);

      // Printing the migratory information of the bird.
      switch ((*creature).specification.bird.does_migrate) {
        case 0:
          fprintf(file, "does_migrate = FALSE }\n");
          break;
        default: // Since any value other than 0 is true, print it.
          fprintf(file, "does_migrate = TRUE }\n");
          break;
      }
      break;

    case 3: // Fish.
      fprintf(file, "FISH { name = \"%s\", weight = %d, ",
              (*creature).name,
              (*creature).weight);

      // Printing the habitat of the fish.
      switch ((*creature).specification.fish.habitat) {
        case 1:
          fprintf(file, "habitat = LAKE }\n");
          break;
        case 2:
          fprintf(file, "habitat = RIVER }\n");
          break;
        case 3:
          fprintf(file, "habitat = SEA }\n");
          break;
        default:
          printf("Unknown habitat of fish at index %d: %d.\n",
                 index,
                 (*creature).specification.fish.habitat);
          exit(-5);
      }
      break;

    default: // An unknown creature type was passed into creatures. Exiting the program.
      printf("Unknown creature at index %d: %d.\n",
             index,
             (*creature).creature_type);
      exit(-6);
  }
}


int read_data_from_file(char *filename, creature *creatures, int max_element_count) {
  FILE *input_file = fopen(filename, "r");
  if (input_file == NULL) {
    printf("Could not open file: %s.\n", filename);
    exit(-10);
  }

  // See README to find out about how to read data.
  int input;  // Dummy variable to store the acquired value.
  int index = 0;

  while (!feof(input_file) && index < max_element_count) {
    fscanf(input_file, "%s %d %d",
           creatures[ index ].name,
           &creatures[ index ].weight,
           &creatures[ index ].creature_type);

    // Incorrect weight.
    if (creatures[ index ].weight <= 0) {
      printf("Invalid weight of creature at index %d: %d. "
             "Must be an integer, at least 1.\n",
             index,
             creatures[ index ].weight);
      exit(-11);
    }

    switch (creatures[ index ].creature_type) {
      case 1: // Animal.
        fscanf(input_file, "%d", &input);
        if (input >= 1 && input <= 4) {
          creatures[ index ].specification.animal.food_source = input;
        } else {
          printf("Unknown food_source value for animal at index %d: %d. "
                 "Expected value in range from 1 to 4.\n",
                 index,
                 input);
          exit(-12);
        }
        break;

      case 2: // Bird.
        fscanf(input_file, "%d", &creatures[ index ].specification.bird.does_migrate);
        break;

      case 3: // Fish.
        fscanf(input_file, "%d", &input);
        if (input >= 1 && input <= 3) {
          creatures[ index ].specification.fish.habitat = input;
        } else {
          printf("Unknown habitat value for fish at index %d: %d. "
                 "Expected value in range from 1 to 3.\n",
                 index,
                 input);
          exit(-13);
        }
        break;

      default:
        printf("Invalid creature type for creature at index %d: %d. "
               "Only 1 (animal), 2 (bird), 3 (fish) are allowed.\n",
               index,
               creatures[ index ].creature_type);
        exit(-14);
    }

    ++index;
  }

  fclose(input_file);
  return index;
}


int generate_randomly(creature *creatures, int count, int max_element_count) {
  // The number of items to generate: either COUNT, or MAX_ELEMENT_COUNT (if COUNT is bigger).
  int min = count < max_element_count ? count : max_element_count;

  for (int i = 0; i < min; ++i) {
    creatures[ i ] = generate_creature(i);
  }

  return min;
}


void write_data_to_file(char *filename, creature *creatures, int count, int mode) {
  FILE *output_file;
  if (mode == 0) {
    output_file = fopen(filename, "w");
  } else {
    output_file = fopen(filename, "a");
  }

  if (output_file == NULL) {
    printf("Something went wrong when creating file: %s.\n", filename);
    exit(-14);
  }

  if (mode == 0) {
    fprintf(output_file, "Data contains %d creatures:\n", count);
  } else {
    fprintf(output_file, "\nSorted data of %d creatures:\n", count);
  }

  for (int i = 0; i < count; ++i) {
    print_creature_to_file(output_file, &creatures[ i ], i);
  }

  fclose(output_file);
}


void swap(creature *creature1, creature *creature2) {
  creature temp;
  temp.weight = 69; // Useless line to initialize the creature.

  copy(creature1, &temp);
  copy(creature2, creature1);
  copy(&temp, creature2);
}


void heapify(creature *creatures, int length, int index) {
  int smallest = index;
  int left = 2 * index + 1;
  int right = 2 * index + 2;

  if (left < length && compare(&creatures[ left ], &creatures[ smallest ]) == -1) {
    smallest = left;
  }
  if (right < length && compare(&creatures[ right ], &creatures[ smallest ]) == -1) {
    smallest = right;
  }

  if (smallest != index) {
    swap(&creatures[ index ], &creatures[ smallest ]);
    heapify(creatures, length, smallest);
  }
}


void heap_sort_desc(creature *creatures, int length) {
  for (int i = length / 2 - 1; i >= 0; i--) {
    heapify(creatures, length, i);
  }

  for (int i = length - 1; i >= 0; i--) {
    swap(&creatures[ 0 ], &creatures[ i ]);
    heapify(creatures, i, 0);
  }
}


int main(int argc, char *argv[]) {
  clock_t start = clock();

  // Incorrect number of arguments passed.
  if (argc != 4) {
    printf("Incorrect number of input parameters. Run the program like this:\n"
           "PROGRAM_NAME -f INPUT_FILE OUTPUT_FILE\n"
           "or like this:\n"
           "PROGRAM_NAME -r NUMBER_OF_ELEMENTS OUTPUT_FILE\n");
    return -1;
  }

  // If the second parameter (i.e. tag) is -r, randomize the seed.
  if (strcmp(argv[ 1 ], "-r") == 0) {
    srand(time(NULL));
  }


  creature creatures[MAX_NUMBER_OF_ELEMENTS];
  int length;

  // If the tag is -f, read data from the specified file.
  // If the tag is -r, generate the data randomly.
  // Otherwise, return an error.
  if (strcmp(argv[ 1 ], "-f") == 0) {
    length = read_data_from_file(argv[ 2 ], creatures, MAX_NUMBER_OF_ELEMENTS);
  } else if (strcmp(argv[ 1 ], "-r") == 0) {
    int number_of_elements = atoi(argv[ 2 ]);
    if (number_of_elements < 0) {
      printf("Cannot generate a negative number of elements.\n"
             "Pass the correct value when using -r.");
      return -16;
    }

    length = generate_randomly(creatures, number_of_elements, MAX_NUMBER_OF_ELEMENTS);
  } else {
    printf("Unknown tag: %s. Expected -f or -r.\n", argv[ 1 ]);
    return -2;
  }

  printf("Retrieved data from file.\n");

  // Writing the data before sorting.
  write_data_to_file(argv[ 3 ], creatures, length, 0);
  printf("Written the original data in file.\n");

  // Sorting the creature data.
  heap_sort_desc(creatures, length);
  printf("Data sorted.\n");

  // Writing the sorted data.
  write_data_to_file(argv[ 3 ], creatures, length, 1);
  printf("Written the sorted data in file.\n");

  clock_t end = clock();
  printf("Executed in %ld ms.", end - start);

  return 0;
}
