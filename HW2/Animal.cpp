#include "Animal.h"


const char *Animal::food_source_names_[] =
        {"CARNIVORE",
         "HERBIVORE",
         "INSECTIVORE",
         "OMNIVORE"};

Animal::Animal(std::string *name, int weight, FoodSource foodSource) {
    name_ = *name;
    weight_ = weight;
    foodSource_ = foodSource;
}

Animal *Animal::clone() {
    return new Animal(&name_, weight_, foodSource_);
}

std::string Animal::toString() {
    return "ANIMAL { name = \"" + name_ + "\"; " +
           "weight = " + std::to_string(weight_) + "; " +
           "food_source = " + food_source_names_[foodSource_ - 1] +
           "; metric = " + std::to_string(getMetric()) + " }";
}
