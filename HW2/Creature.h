#ifndef HW2_CREATURE_H
#define HW2_CREATURE_H


#include <string>


/**
 * Base class for all creatures (animals, birds and fish). Cannot be instantiated.
 */
class Creature {
protected:
    /**
     * The name of the creature.
     */
    std::string name_;
    /**
     * The weight of the creature.
     */
    int weight_;

public:
    /**
     * Calculates the metric for a creature: the sum of char codes of symbols of the name
     * divided by the weight.
     *
     * @return The described metric of the creature.
     */
    double getMetric();

    /**
     * Creates a clone of this creature.
     */
    virtual Creature *clone() = 0;

    /**
     * Expresses the creature as a string.
     *
     * @return The string representation of the creature.
     */
    virtual std::string toString();

    /**
     * Overriding the "less than" operator for comparing two creatures.
     *
     * @param other The creature to compare this one to.
     * @return True, if this creature is bigger or equal (i.e. its metric is bigger or equal)
     * to the other one; false, otherwise.
     */
    bool operator<(Creature *other);
};


#endif //HW2_CREATURE_H
