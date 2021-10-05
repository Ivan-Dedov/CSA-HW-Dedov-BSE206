#include <stdio.h>
#include <stdlib.h>

#include "creature.h"
#include "data_loader.h"


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
               creatures[index].name,
               &creatures[index].weight,
               &creatures[index].creature_type);

        // Incorrect weight.
        if (creatures[index].weight <= 0) {
            printf("Invalid weight of creature at index %d: %d. "
                   "Must be an integer, at least 1.\n",
                   index,
                   creatures[index].weight);
            exit(-11);
        }

        switch (creatures[index].creature_type) {
            case 1: // Animal.
                fscanf(input_file, "%d", &input);
                if (input >= 1 && input <= 4) {
                    creatures[index].specification.animal.food_source = input;
                } else {
                    printf("Unknown food_source value for animal at index %d: %d. "
                           "Expected value in range from 1 to 4.\n",
                           index,
                           input);
                    exit(-12);
                }
                break;

            case 2: // Bird.
                fscanf(input_file, "%d", &creatures[index].specification.bird.does_migrate);
                break;

            case 3: // Fish.
                fscanf(input_file, "%d", &input);
                if (input >= 1 && input <= 3) {
                    creatures[index].specification.fish.habitat = input;
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
                       creatures[index].creature_type);
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
        creatures[i] = generate_creature(i);
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
        print_creature_to_file(output_file, &creatures[i], i);
    }

    fclose(output_file);
}


void write_data_to_std(creature *creatures, int count) {
    for (int i = 0; i < count; ++i) {
        print_creature_to_std(&creatures[i], i);
    }
}


void write_data_without_formatting(char *filename, creature *creatures, int count) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Something went wrong when creating file: %s.\n", filename);
        exit(-15);
    }

    creature creature;
    for (int i = 0; i < count; ++i) {
        creature = creatures[i];
        fprintf(file, "%s %d %d ", creature.name, creature.weight, creature.creature_type);

        switch (creature.creature_type) {
            case 1: // Animal.
                fprintf(file, "%d\n", creature.specification.animal.food_source);
                break;

            case 2: // Bird.
                fprintf(file, "%d\n", creature.specification.bird.does_migrate);
                break;

            case 3: // Fish.
                fprintf(file, "%d\n", creature.specification.fish.habitat);
                break;
        }
    }

    fclose(file);
}
