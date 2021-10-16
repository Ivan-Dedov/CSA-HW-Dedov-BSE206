#ifndef HW2_ANIMAL_H
#define HW2_ANIMAL_H


#include <string>

#include "Creature.h"
#include "FoodSource.h"


/**
 * Defines the Animal subtype of creatures.
 */
class Animal : public Creature {
protected:
    /**
     * The food source that the animal uses (see FoodSource.h for enum definition).
     */
    FoodSource foodSource_;

public:
    /**
     * The static array of string values for the names of food sources of Animals.
     * Used when converting the enum values from integer to string form.
     */
    static const char *food_source_names_[];

    /**
     * Creates a new instance of Animal.
     *
     * @param name The name of the animal.
     * @param weight The weight of the animal.
     * @param foodSource The food source that the animal uses.
     */
    Animal(std::string *name, int weight, FoodSource foodSource);

    std::string toString() override;
};


#endif //HW2_ANIMAL_H
