#include "creature.h"
#include "heap_sort.h"


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

    if (left < length && compare(&creatures[left], &creatures[smallest]) == -1) {
        smallest = left;
    }
    if (right < length && compare(&creatures[right], &creatures[smallest]) == -1) {
        smallest = right;
    }

    if (smallest != index) {
        swap(&creatures[index], &creatures[smallest]);
        heapify(creatures, length, smallest);
    }
}


void heap_sort_desc(creature *creatures, int length) {
    for (int i = length / 2 - 1; i >= 0; i--) {
        heapify(creatures, length, i);
    }

    for (int i = length - 1; i >= 0; i--) {
        swap(&creatures[0], &creatures[i]);
        heapify(creatures, i, 0);
    }
}
