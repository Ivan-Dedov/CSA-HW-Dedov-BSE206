#include <string>

#include "Bird.h"


Bird::Bird(std::string *name, int weight, bool doesMigrate) {
    name_ = *name;
    weight_ = weight;
    doesMigrate_ = doesMigrate;
}

std::string Bird::toString() {
    std::string result = "BIRD { name = \"" + name_ + "\"; " +
                         "weight = " + std::to_string(weight_) + "; " +
                         "does_migrate = ";
    if (doesMigrate_) {
        result += "TRUE }";
    } else {
        result += "FALSE }";
    }
    return result;
}
