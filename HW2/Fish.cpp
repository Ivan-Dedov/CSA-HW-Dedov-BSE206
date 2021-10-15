#include "Fish.h"


const char *Fish::habitat_names_[] =
        {"LAKE",
         "RIVER",
         "SEA"};

Fish::Fish(std::string *name, int weight, Habitat habitat) {
    name_ = *name;
    weight_ = weight;
    habitat_ = habitat;
}

Fish *Fish::clone() {
    return new Fish(&name_, weight_, habitat_);
}

std::string Fish::toString() {
    return "FISH { name = \"" + name_ + "\"; " +
           "weight = " + std::to_string(weight_) + "; " +
           "habitat = " + habitat_names_[habitat_ - 1] +
           "; metric = " + std::to_string(getMetric()) + " }";
}
