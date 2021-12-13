#include <unistd.h>
#include "customer.h"

/**
 * Returns a random double value in the specified range.
 * @param min The minimum value of the output number.
 * @param max The maximum value of the output number.
 * @return A random double in the specified range.
 */
double randDouble(int min, int max) {
    int num = rand() % (max * 100) + min * 100;
    return num / 100.0;
}

Customer *Customer::createCustomer(int number_of_queues) {
    Customer *customer = new Customer();

    customer->name = "Customer" + std::to_string(rand() % 1000);
    customer->price = randDouble(1, 100);
    customer->queue_number = rand() % number_of_queues;

    // Sleep between 1 and 5 seconds.
    customer->checkout_time = rand() % 5000000 + 1000000;

    // Creating a customer "took some time" - between 1 and 3 seconds.
    usleep(rand() % 3000000 + 1000000);

    return customer;
};
