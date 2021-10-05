#include <stdlib.h>
#include <string.h>

#include "creature.h"


double get_creature_metric(creature *creature) {
    char *name = (*creature).name;
    size_t name_length = strlen(name);

    double name_char_sum = 0;
    for (size_t i = 0; i < name_length; ++i) {
        name_char_sum += (int) name[i];
    }

    return name_char_sum / (*creature).weight;
}

int compare(creature *creature1, creature *creature2) {
    double metric1 = get_creature_metric(creature1);
    double metric2 = get_creature_metric(creature2);

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
        (*destination).name[i] = (*target).name[i];
    }
    (*destination).name[name_length] = '\0';

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
        name[i] = number[i];
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


void print_creature_to_std(creature *creature, int index) {
    // Printing the creature data into the console according to the creature's type.
    switch ((*creature).creature_type) {
        case 1: // Animal.
            printf("ANIMAL { name = \"%s\", weight = %d, ",
                   (*creature).name,
                   (*creature).weight);

            // Printing the food source of the animal.
            switch ((*creature).specification.animal.food_source) {
                case 1:
                    printf("food_source = CARNIVORE }\n");
                    break;
                case 2:
                    printf("food_source = HERBIVORE }\n");
                    break;
                case 3:
                    printf("food_source = INSECTIVORE }\n");
                    break;
                case 4:
                    printf("food_source = OMNIVORE }\n");
                    break;
                default:
                    printf("Unknown food source of animal at index %d: %d.\n",
                           index,
                           (*creature).specification.animal.food_source);
                    exit(-7);
            }
            break;

        case 2: // Bird.
            printf("BIRD { name = \"%s\", weight = %d, ",
                   (*creature).name,
                   (*creature).weight);

            // Printing the migratory information of the bird.
            switch ((*creature).specification.bird.does_migrate) {
                case 0:
                    printf("does_migrate = FALSE }\n");
                    break;
                default: // Since any value other than 0 is true, print it.
                    printf("does_migrate = TRUE }\n");
                    break;
            }
            break;

        case 3: // Fish.
            printf("FISH { name = \"%s\", weight = %d, ",
                   (*creature).name,
                   (*creature).weight);

            // Printing the habitat of the fish.
            switch ((*creature).specification.fish.habitat) {
                case 1:
                    printf("habitat = LAKE }\n");
                    break;
                case 2:
                    printf("habitat = RIVER }\n");
                    break;
                case 3:
                    printf("habitat = SEA }\n");
                    break;
                default:
                    printf("Unknown habitat of fish at index %d: %d.\n",
                           index,
                           (*creature).specification.fish.habitat);
                    exit(-8);
            }
            break;

        default:
            printf("Unknown creature at index %d: %d.\n",
                   index,
                   (*creature).creature_type);
            exit(-9);
    }
}
