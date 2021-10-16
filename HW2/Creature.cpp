#include "Creature.h"


double Creature::getMetric() {
    double name_char_sum = 0;
    size_t name_length = name_.length();
    for (int i = 0; i < name_length; ++i) {
        name_char_sum += static_cast<double>(name_[i]);
    }
    return name_char_sum / weight_;
}

bool Creature::operator<(Creature &other) {
    return this->getMetric() < other.getMetric();
}

bool Creature::operator>(Creature &other) {
    return this->getMetric() > other.getMetric();
}

bool Creature::operator==(Creature &other) {
    return this->getMetric() == other.getMetric();
}

bool Creature::operator!=(Creature &other) {
    return this->getMetric() != other.getMetric();
}
