#ifndef HW2_BIRD_H
#define HW2_BIRD_H


#include <string>

#include "Creature.h"


/**
 * Defines the Bird subtype of creatures.
 */
class Bird : public Creature {
protected:
    /**
     * Boolean value that stores whether the bird migrates or not.
     */
    bool doesMigrate_;

public:
    /**
     * Creates a new instance of Bird.
     *
     * @param name The name of the bird.
     * @param weight The weight of the bird.
     * @param doesMigrate true, if the bird is migratory; false, otherwise.
     */
    Bird(std::string *name, int weight, bool doesMigrate);

    std::string toString() override;
};


#endif //HW2_BIRD_H
