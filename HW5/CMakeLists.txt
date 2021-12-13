cmake_minimum_required(VERSION 3.21)
project(HW5)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS -pthread)

add_executable(HW5
        customer.h
        customer.cpp

        main.cpp)
