cmake_minimum_required(VERSION 3.20)
project(HW2)

set(CMAKE_CXX_STANDARD 17)

add_executable(HW2
        Animal.h
        Bird.h
        Creature.h
        CreatureArray.h
        Fish.h
        FoodSource.h
        Habitat.h

        Animal.cpp
        Bird.cpp
        Creature.cpp
        CreatureArray.cpp
        Fish.cpp

        main.cpp)
