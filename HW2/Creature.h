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
     * Expresses the creature as a string.
     *
     * @return The string representation of the creature.
     */
    virtual std::string toString() = 0;

    /**
     * Overloading the "less than" operator for comparing two creatures.
     *
     * @param other The creature to compare this one to.
     * @return True, if this creature is less (i.e. its metric is less) than the other one;
     * false, otherwise.
     */
    virtual bool operator<(Creature &other);

    /**
     * Overloading the "greater than" operator for comparing two creatures.
     *
     * @param other The creature to compare this one to.
     * @return True, if this creature is greater (i.e. its metric is greater) than the other one;
     * false, otherwise.
     */
    virtual bool operator>(Creature &other);

    /**
     * Overloading the "equal to" operator for comparing two creatures.
     *
     * @param other The creature to compare this one to.
     * @return True, if this creature is equal (i.e. its metric is equal) to the other one;
     * false, otherwise.
     */
    virtual bool operator==(Creature &other);

    /**
     * Overloading the "not equal to" operator for comparing two creatures.
     *
     * @param other The creature to compare this one to.
     * @return True, if this creature is not equal (i.e. its metric is not equal) to the other one;
     * false, otherwise.
     */
    virtual bool operator!=(Creature &other);
};


#endif //HW2_CREATURE_H
