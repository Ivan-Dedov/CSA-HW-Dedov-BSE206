#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#include "creature.h"
#include "data_loader.h"
#include "heap_sort.h"


/**
 * The maximum number of elements in the array.
 */
#define MAX_NUMBER_OF_ELEMENTS 10000


int main(int argc, char *argv[]) {
    // Incorrect number of arguments passed.
    if (argc != 4) {
        printf("Incorrect number of input parameters. Run the program like this:\n"
               "PROGRAM_NAME -f INPUT_FILE OUTPUT_FILE\n"
               "or like this:\n"
               "PROGRAM_NAME -r NUMBER_OF_ELEMENTS OUTPUT_FILE\n");
        return -1;
    }

    // If the second parameter (i.e. tag) is -r, randomize the seed.
    if (strcmp(argv[1], "-r") == 0) {
        srand(time(NULL));
    }


    creature creatures[MAX_NUMBER_OF_ELEMENTS];
    int length;

    // If the tag is -f, read data from the specified file.
    // If the tag is -r, generate the data randomly.
    // Otherwise, return an error.
    if (strcmp(argv[1], "-f") == 0) {
        length = read_data_from_file(argv[2], creatures, MAX_NUMBER_OF_ELEMENTS);
    } else if (strcmp(argv[1], "-r") == 0) {
        int number_of_elements = atoi(argv[2]);
        if (number_of_elements < 0) {
            printf("Cannot generate a negative number of elements.\n"
                   "Pass the correct value when using -r.");
            return -16;
        }

        length = generate_randomly(creatures, number_of_elements, MAX_NUMBER_OF_ELEMENTS);
    } else {
        printf("Unknown tag: %s. Expected -f or -r.\n", argv[1]);
        return -2;
    }


    // Writing the data before sorting.
    printf("Original data contains %d elements:\n", length);
    // According to part 3, writing the original data to both,
    // the standard output and the specified output file.
    write_data_to_std(creatures, length);
    write_data_to_file(argv[3], creatures, length, 0);

    // Sorting the creature data.
    heap_sort_desc(creatures, length);

    // Writing the sorted data.
    printf("\nSorted data of %d elements:\n", length);
    // Again, according to part 3, writing the original data to both,
    // the standard output and the specified output file.
    write_data_to_std(creatures, length);
    write_data_to_file(argv[3], creatures, length, 1);

    // Uncomment to remove formatting from output
    // (might be necessary to generate test files):

    // write_data_without_formatting(argv[3], creatures, length);

    return 0;
}
