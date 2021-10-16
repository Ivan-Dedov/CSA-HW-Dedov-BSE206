#ifndef HW2_CREATUREARRAY_H
#define HW2_CREATUREARRAY_H


#include "Creature.h"


/**
 * A container that stores different types of creatures. Has methods for retrieving data from
 * a file, writing the data to the console and a file, sorting and randomly generating creatures.
 */
class CreatureArray {
private:
    /**
     * The contents of the array that can contain multiple types of creatures at once.
     */
    Creature **data_ = new Creature*[kMaxSize];
    /**
     * The number of items inside the array.
     */
    int size_;

    /**
     * Swaps two creatures.
     *
     * @param first_index The index of the first creature inside the array.
     * @param second_index The index of the second creature inside the array.
     */
    void swap(int first_index, int second_index);

    /**
     * Makes heaps for the heap sort.
     *
     * @param length The length of the array to heapify.
     * @param index The index of the current element.
     */
    void heapify(int length, int index);

public:
    /**
     * The maximum number of items inside the array.
     */
    static const int kMaxSize = 10000;

    /**
     * Creates a new instance of the array of creatures.
     */
    CreatureArray();

    /**
     * Retrieves the occupied length of the array of creatures.
     *
     * @return The number of elements inside the array.
     */
    int size();

    /**
     * Extracts creature data from the specified file.
     *
     * @param filename The name of the file to open and read from.
     */
    void fillFromFile(char *filename);

    /**
     * Randomly generates creatures using the specified parameters.
     *
     * @param count The number of elements to generate.
     */
    void generateRandomly(int count);

    /**
     * Writes the creature data into the specified file.
     *
     * @param filename The name_ of the file to write the data into.
     * @param mode The mode in which to open the file: 0 for writing, anything else for appending
     * the existing content inside the file.
     */
    void printToFile(char *filename, int mode);

    /**
     * Writes the creature data into the standard output.
     */
    void printToStd();

    /**
     * Sorts the array using the heapsort algorithm (in descending order).
     */
    void heapSortDescending();
};

#endif //HW2_CREATUREARRAY_H
