#ifndef HW2_FISH_H
#define HW2_FISH_H


#include <string>

#include "Creature.h"
#include "Habitat.h"


/**
* Defines the Fish subtype of creatures.
*/
class Fish : public Creature {
protected:
    /**
     * The habitat of the fish (see Habitat.h for enum definition).
     */
    Habitat habitat_;

public:
    /**
     * The static array of string names of different habitats.
     * Used when converting the Habitat enum value from an integer to a string.
     */
    static const char *habitat_names_[];

    /**
     * Creates a new instance of Fish.
     *
     * @param name The name of the fish.
     * @param weight The weight of the fish.
     * @param habitat The habitat where the fish lives.
     */
    Fish(std::string *name, int weight, Habitat habitat);

    std::string toString() override;
};


#endif //HW2_FISH_H
