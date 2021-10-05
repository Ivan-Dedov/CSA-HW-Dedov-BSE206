#ifndef HW1_CREATURE_H
#define HW1_CREATURE_H


#include <stdio.h>

#include "animal.h"
#include "bird.h"
#include "fish.h"


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


/**
 * Calculates the metric for a creature (used when sorting).
 *
 * @param creature The creature to get the metric of.
 * @return The metric of the creature.
 */
double get_creature_metric(creature *creature);


/**
 * Compares two creatures using the metric.
 * @param creature1 The first creature.
 * @param creature2 The second creature.
 * @return 1, if the first creature is "bigger";
 * -1, if the first creature is "smaller";
 * 0, otherwise.
 */
int compare(creature *creature1, creature *creature2);


/**
 * Copies the target creature to the destination creature.
 *
 * @param target The target creature.
 * @param destination The destination creature.
 */
void copy(creature *target, creature *destination);


/**
 * Retrieves the name of the creature based on its index.
 *
 * @param name The char array of length 64 in which to put the name.
 * @param index The index of the creature inside the array.
 */
void get_creature_name(char *name, int index);


/**
 * Generates a random creature.
 *
 * @param index The index of the creature inside the array.
 * @return The generated creature.
 */
creature generate_creature(int index);


/**
 * Prints the creature info into the specified file.
 *
 * @param file The file in which to write (must be opened).
 * @param creature The creature from which to extract the info.
 * @param index The index where the creature is at in the array.
 */
void print_creature_to_file(FILE *file, creature *creature, int index);


/**
 * Prints the creature info into the standard output.
 *
 * @param creature The creature from which to extract the info.
 * @param index THe index where the creature is in the array.
 */
void print_creature_to_std(creature *creature, int index);


#endif //HW1_CREATURE_H
