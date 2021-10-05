#ifndef HW1_ANIMAL_H
#define HW1_ANIMAL_H


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


#endif //HW1_ANIMAL_H
