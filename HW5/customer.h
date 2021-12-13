#ifndef HW5_CUSTOMER_H
#define HW5_CUSTOMER_H

#include <string>

/**
 * Represents a customer of the store.
 */
struct Customer {
    /**
     * The name of the customer.
     */
    std::string name;

    /**
     * The number of the queue that the customer is in.
     */
    int queue_number;

    /**
     * The price of the customer's products.
     */
    double price;

    /**
     * The number of seconds it will take the cashier to check out the customer's products.
     */
    int checkout_time;

    /**
     * Creates a new random customer.
     * @param number_of_queues The number of queues available to choose from.
     * @return The randomly generated customer.
     */
    static Customer *createCustomer(int number_of_queues);
};

#endif
