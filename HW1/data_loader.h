#ifndef HW1_DATA_LOADER_H
#define HW1_DATA_LOADER_H


#include "creature.h"


/**
 * Extracts creature data from the specified file.
 *
 * @param filename The name of the file to open and read from.
 * @param creatures The array of creatures in which to store the extracted data.
 * @param max_element_count The maximum size of the array of creatures.
 * @return The number of items inserted into the array.
 */
int read_data_from_file(char *filename, creature *creatures, int max_element_count);


/**
 * Randomly generates creatures using the specified parameters.
 *
 * @param creatures The array of creatures in which to store the generated data.
 * @param count The number of elements to generate.
 * @param max_element_count The maximum number of items in the array.
 * @return The number of creatures that were generated.
 */
int generate_randomly(creature *creatures, int count, int max_element_count);


/**
 * Writes the creature data into the specified file.
 *
 * @param filename The name of the file to write the data into.
 * @param creatures The array of creatures to output into the file.
 * @param count The number of elements inside the given array.
 * @param mode The mode in which to open the file: 0 for writing, anything else for appending.
 */
void write_data_to_file(char *filename, creature *creatures, int count, int mode);


/**
 * Writes the creature data into the standard output.
 *
 * @param creatures The array of creatures to write into.
 * @param count The number of elements inside the given array.
 */
void write_data_to_std(creature *creatures, int count);


/**
 * Prints creatures without formatting (i.e. just numbers). Used only for generating tests.
 *
 * @param filename The name of the file in which to print creatures.
 * @param creatures The array of creatures to print from.
 * @param count The number of elements in that array.
 */
void write_data_without_formatting(char *filename, creature *creatures, int count);


#endif //HW1_DATA_LOADER_H
