#ifndef HW1_HEAP_SORT_H
#define HW1_HEAP_SORT_H


#include "creature.h"


/**
 * Swaps two creatures.
 *
 * @param creature1 The first creature.
 * @param creature2 The second creature.
 */
void swap(creature *creature1, creature *creature2);


/**
 * Makes heaps for the heap sort.
 *
 * @param creatures The array to form heaps from.
 * @param length The length of the array.
 * @param index The index of the current element.
 */
void heapify(creature *creatures, int length, int index);


/**
 * Sorts the array using the heapsort algorithm (in descending order).
 *
 * @param creatures The array of creatures to sort.
 * @param length The number of items in the given array.
 */
void heap_sort_desc(creature *creatures, int length);


#endif //HW1_HEAP_SORT_H
