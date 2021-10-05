#ifndef HW1_FISH_H
#define HW1_FISH_H


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


#endif //HW1_FISH_H
