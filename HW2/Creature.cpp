#include <string>
#include <typeinfo>

#include "Creature.h"


double Creature::getMetric() {
    double name_char_sum = 0;
    size_t name_length = name_.length();
    for (int i = 0; i < name_length; ++i) {
        name_char_sum += static_cast<double>(name_[i]);
    }
    return name_char_sum / weight_;
}

std::string Creature::toString() {
    return "CREATURE { metric = " + std::to_string(getMetric()) +
           "; name = \"" + name_ + "\"" +
           "; weight = " + std::to_string(weight_) + " }";
}

Creature *Creature::clone() {
    return nullptr;
}

bool Creature::operator<(Creature *other) {
    return this->getMetric() < other->getMetric();
}
