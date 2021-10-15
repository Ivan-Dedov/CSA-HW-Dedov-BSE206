#include <chrono>
#include <iostream>

#include "Creature.h"
#include "CreatureArray.h"


int main(int argc, char **argv) {
    auto start_time = std::chrono::high_resolution_clock::now();
    // Incorrect number of arguments passed.
    if (argc != 4) {
        std::cout << "Incorrect number of input parameters. Run the program like this:\n"
                  << "PROGRAM_NAME -f INPUT_FILE OUTPUT_FILE\n"
                  << "or like this:\n"
                  << "PROGRAM_NAME -r NUMBER_OF_ELEMENTS OUTPUT_FILE\n";
        return -1;
    }

    CreatureArray creatures;

    // If the tag is -f, read data from the specified file.
    // If the tag is -r, generate the data randomly.
    // Otherwise, return an error.
    if (static_cast<std::string>(argv[1]) == "-f") {
        creatures.fillFromFile(argv[2]);
    } else if (static_cast<std::string>(argv[1]) == "-r") {
        int number_of_elements = std::stoi(argv[2]);
        if (number_of_elements < 0) {
            std::cout << "Cannot generate a negative number of elements.\n"
                      << "Pass the correct value when using -r.\n";
            return -2;
        }

        creatures.generateRandomly(number_of_elements);
    } else {
        std::cout << "Unknown tag: \"" << argv[1] << "\". Expected -f or -r.\n";
        return -3;
    }


    // Writing the data before sorting.
    std::cout << "Original data contains " << creatures.size() << " elements:\n";
    // According to part 3, writing the original data to both,
    // the standard output and the specified output file.
    creatures.printToStd();
    creatures.printToFile(argv[3], 0);

    // Sorting the creature data.
    creatures.heapSortDescending();

    // Writing the sorted data.
    std::cout << "\nSorted data of " << creatures.size() << " elements:\n";
    // Again, according to part 3, writing the original data to both,
    // the standard output and the specified output file.
    creatures.printToStd();
    creatures.printToFile(argv[3], 1);

    // Measuring execution time.
    auto end_time = std::chrono::high_resolution_clock::now();
    auto ms_int = std::chrono::duration_cast<std::chrono::milliseconds>(end_time - start_time);
    std::cout << "\n\n\nTotal execution time: " << ms_int.count() << " ms\n";

    return 0;
}
