cmake_minimum_required(VERSION 3.20)
project(HW1 C)

set(CMAKE_C_STANDARD 11)

add_executable(HW1
        animal.h
        bird.h
        creature.h
        data_loader.h
        fish.h
        heap_sort.h

        main.c
        creature.c
        data_loader.c
        heap_sort.c
        )
