#include <iostream>
#include <fstream>
#include <random>
#include <string>

#include "Animal.h"
#include "Bird.h"
#include "CreatureArray.h"
#include "Fish.h"


CreatureArray::CreatureArray() {
    size_ = 0;
}

void CreatureArray::fillFromFile(char *filename) {
    // Opening the file.
    std::ifstream input_file;
    input_file.open(filename);
    if (!input_file.is_open()) {
        std::cout << "Could not open file: \"" << filename << "\".\n";
        exit(-101);
    }

    std::string creature_name;
    int weight, creature_type, additional_parameter;
    int index = 0;

    // While there are still lines of code, read and parse the information into creatures.
    // If not possible, exit and output an error to the console.
    while (!input_file.eof()) {
        if (!(input_file >> creature_name >> weight >> creature_type >> additional_parameter)) {
            std::cout << "Error when reading file \"" << filename << "\".\n";
            exit(-103);
        }

        if (creature_type == 1) {
            if (additional_parameter < 1 || additional_parameter > 4) {
                std::cout << "Incorrect animal food source: " << additional_parameter << ".\n";
                exit(-105);
            }

            data_[index] = new Animal(&creature_name,
                                      weight,
                                      static_cast<FoodSource>(additional_parameter));
        } else if (creature_type == 2) {
            data_[index] = new Bird(&creature_name,
                                    weight,
                                    additional_parameter);
        } else if (creature_type == 3) {
            if (additional_parameter < 1 || additional_parameter > 3) {
                std::cout << "Incorrect fish habitat: " << additional_parameter << ".\n";
                exit(-104);
            }

            data_[index] = new Fish(&creature_name,
                                    weight,
                                    static_cast<Habitat>(additional_parameter));
        } else {
            std::cout << "Error when reading file. Creature with unknown type "
                      << creature_type << ".\n";
            exit(-102);
        }

        ++index;
    }

    size_ = index;
    input_file.close();
}

std::string generateName(int index) {
    return std::to_string(index);
}

Creature *generateCreature(int index, std::mt19937 *gen) {
    // Different random distributions.
    std::uniform_int_distribution<> creature_type_generator(1, 3);
    std::uniform_int_distribution<> weight_generator(1, 100000);
    std::uniform_int_distribution<> food_source_generator(1, 4);
    std::uniform_int_distribution<> does_migrate_generator(0, 1);
    std::uniform_int_distribution<> habitat_generator(1, 3);

    int creature_type = creature_type_generator(*gen);

    std::string name = generateName(index);
    int weight = weight_generator(*gen);
    if (creature_type == 1) {
        auto *animal = new Animal(&name,
                                  weight,
                                  static_cast<FoodSource>(food_source_generator(*gen)));
        return animal;
    } else if (creature_type == 2) {
        Bird *bird = new Bird(&name,
                              weight,
                              does_migrate_generator(*gen));
        return bird;
    } else if (creature_type == 3) {
        Fish *fish = new Fish(&name,
                              weight,
                              static_cast<Habitat>(habitat_generator(*gen)));
        return fish;
    } else {
        return nullptr;
    }
}

void CreatureArray::generateRandomly(int count) {
    // The number of items to generate: either COUNT, or KMAXSIZE (if COUNT is bigger).
    int min = count < kMaxSize ? count : kMaxSize;

    // Setting up random number generation.
    std::random_device rd;
    std::mt19937 gen(rd());

    for (int i = 0; i < min; ++i) {
        data_[i] = generateCreature(i, &gen);
    }
    size_ = min;
}

void CreatureArray::printToFile(char *filename, int mode) {
    std::ofstream output_file;
    if (mode) {
        output_file.open(filename, std::ios::app);
        output_file << "\nSorted data contains " << size_ << " elements:\n";
    } else {
        output_file.open(filename);
        output_file << "Data contains " << size_ << " elements:\n";
    }
    if (!output_file.is_open()) {
        std::cout << "Something went wrong when creating file: \"" << filename << "\".\n";
        exit(-201);
    }

    for (int i = 0; i < size_; ++i) {
        output_file << data_[i]->toString() << "\n";
    }

    output_file.close();
}

void CreatureArray::swap(int first_index, int second_index) {
    Creature *temp = data_[first_index];
    data_[first_index] = data_[second_index];
    data_[second_index] = temp;
}

void CreatureArray::heapify(int length, int index) {
    int smallest = index;
    int left = 2 * index + 1;
    int right = 2 * index + 2;

    if (left < length && (*data_[left] < *data_[smallest])) {
        smallest = left;
    }
    if (right < length && (*data_[right] < *data_[smallest])) {
        smallest = right;
    }

    if (smallest != index) {
        swap(index, smallest);
        heapify(length, smallest);
    }
}

void CreatureArray::heapSortDescending() {
    for (int i = size_ / 2 - 1; i >= 0; i--) {
        heapify(size_, i);
    }

    for (int i = size_ - 1; i >= 0; i--) {
        swap(0, i);
        heapify(i, 0);
    }
}
