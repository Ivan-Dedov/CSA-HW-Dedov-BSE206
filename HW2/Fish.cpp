#include <string>

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

std::string Fish::toString() {
    return "FISH { name = \"" + name_ + "\"; " +
           "weight = " + std::to_string(weight_) + "; " +
           "habitat = " + habitat_names_[habitat_ - 1] + " }";
}
