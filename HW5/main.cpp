#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <pthread.h>
#include <unistd.h>
#include <semaphore.h>

#include "customer.h"

// The number of cashiers (i.e. the number of queues). Input from console.
int cashierCount = 2;
// The queues themselves.
std::vector<std::queue<Customer *> *> *queues;

// The number of threads that generate customers. Input from console.
int generatorCount = 3;

// A mutex for console output for no race conditions.
pthread_mutex_t cout_mutex;

// Mutex objects for each of the queues.
std::vector<pthread_mutex_t> *queueMutexes;

// The maximum number of people in each queue. Input from console.
int queueSize = 5;
// Semaphores for each of the queues.
std::vector<sem_t> *semaphoresEmpty;
std::vector<sem_t> *semaphoresFull;

// The total number of customers to check out. Input from console.
int totalCustomerCount = 5;

int generated_customer_count = 0;
int checked_out_customer_count = 0;

pthread_mutex_t generator_mutex;
pthread_mutex_t checkout_mutex;

bool should_wait = true;
pthread_mutex_t wait_mutex;

/**
 * Adds another customer to the queue if there is enough room, otherwise waits.
 * @param args The number of the queue to add to.
 */
void *addCustomerToQueue(void *args) {
    while (generated_customer_count < totalCustomerCount) {
        pthread_mutex_lock(&generator_mutex);
        ++generated_customer_count;
        pthread_mutex_unlock(&generator_mutex);

        Customer *customer = Customer::createCustomer(cashierCount);

        if (generated_customer_count <= totalCustomerCount) {
            sem_wait(&(*semaphoresEmpty)[customer->queue_number]);
            pthread_mutex_lock(&(*queueMutexes)[customer->queue_number]);

            (*queues)[customer->queue_number]->push(customer);

            pthread_mutex_unlock(&(*queueMutexes)[customer->queue_number]);
            sem_post(&(*semaphoresFull)[customer->queue_number]);

            pthread_mutex_lock(&cout_mutex);
            std::cout << customer->name << " with £" << customer->price << " worth of items "
                      << "was placed in queue #" << customer->queue_number + 1 << ".\n";
            pthread_mutex_unlock(&cout_mutex);
        }
    }

    // Ending thread.
    pthread_exit(nullptr);
}

/**
 * Checks out the customer.
 */
void *checkoutCustomer(void *args) {
    // The number of the queue the thread is responsible for.
    int queue_number = *((int *) args);

    while (true) {
//        pthread_mutex_lock(&checkout_mutex);
//        ++checked_out_customer_count;
//        if (checked_out_customer_count >= totalCustomerCount) {
//            pthread_mutex_lock(&wait_mutex);
//            should_wait = false;
//            pthread_mutex_unlock(&wait_mutex);
//        }
//        pthread_mutex_unlock(&checkout_mutex);

        sem_wait(&(*semaphoresFull)[queue_number]);
        pthread_mutex_lock(&(*queueMutexes)[queue_number]);

        Customer *customer = (*queues)[queue_number]->front();
        usleep(customer->checkout_time);
        (*queues)[queue_number]->pop();

        pthread_mutex_unlock(&(*queueMutexes)[queue_number]);
        sem_post(&(*semaphoresEmpty)[queue_number]);

        pthread_mutex_lock(&cout_mutex);
        std::cout << customer->name << " with £" << customer->price << " worth of items "
                  << "was checked out from queue # " << customer->queue_number + 1 << ".\n";
        pthread_mutex_unlock(&cout_mutex);
    }

    // Ending thread.
    pthread_exit(nullptr);
}

/**
 * Initializes mutexes and semaphores.
 */
void setup() {
    srand(time(nullptr));

    pthread_mutex_init(&cout_mutex, nullptr);
    pthread_mutex_init(&generator_mutex, nullptr);
    pthread_mutex_init(&checkout_mutex, nullptr);
    pthread_mutex_init(&wait_mutex, nullptr);

    queues = new std::vector<std::queue<Customer *> *>(cashierCount);
    for (int i = 0; i < cashierCount; ++i) {
        (*queues)[i] = new std::queue<Customer *>();
    }

    queueMutexes = new std::vector<pthread_mutex_t>(cashierCount);
    semaphoresEmpty = new std::vector<sem_t>(cashierCount);
    semaphoresFull = new std::vector<sem_t>(cashierCount);
    for (int i = 0; i < cashierCount; ++i) {
        pthread_mutex_init(&(*queueMutexes)[i], nullptr);
        sem_init(&(*semaphoresEmpty)[i], 0, queueSize);
        sem_init(&(*semaphoresFull)[i], 0, 0);
    }
}

/**
 * Destroys mutexes and semaphores.
 */
void cleanup() {
    for (int i = 0; i < cashierCount + generatorCount; ++i) {
        pthread_mutex_destroy(&(*queueMutexes)[i]);
        sem_destroy(&(*semaphoresEmpty)[i]);
        sem_destroy(&(*semaphoresFull)[i]);
    }

    pthread_mutex_destroy(&cout_mutex);
    pthread_mutex_destroy(&generator_mutex);
    pthread_mutex_destroy(&checkout_mutex);
    pthread_mutex_destroy(&wait_mutex);
}

/**
 * Reads data from the input.
 */
void readArguments(int argc, char *argv[]) {
    if (argc != 5) {
        return;
    }

    try {
        // Must process all four numbers or none at all.
        int arg1 = std::stoi(argv[1]);
        if (arg1 < 1 || arg1 > 100) {
            std::cout << "Cashier count myst be between 1 and 100.\n";
            return;
        }

        int arg2 = std::stoi(argv[2]);
        if (arg2 < 1 || arg2 > 500) {
            std::cout << "Generator count myst be between 1 and 500.\n";
            return;
        }

        int arg3 = std::stoi(argv[3]);
        if (arg3 < 1 || arg3 > 1000) {
            std::cout << "Queue size myst be between 1 and 1000.\n";
            return;
        }

        int arg4 = std::stoi(argv[4]);
        if (arg4 < 1 || arg4 > 10000) {
            std::cout << "Total customer count myst be between 1 and 10000.\n";
            return;
        }

        cashierCount = arg1;
        generatorCount = arg2;
        queueSize = arg3;
        totalCustomerCount = arg4;
    } catch (std::exception &ex) {
        std::cout << "Caught exception when parsing parameters. Using default ones.\n";
        return;
    }
}

int main(int argc, char *argv[]) {
    readArguments(argc, argv);
    setup();

    // Threads for consumers and producers.
    pthread_t threads[cashierCount + generatorCount];
    // Thread arguments - contains the number of the queue that the cashier thread is responsible for.
    int thread_args[cashierCount];

    // Cashier threads.
    for (int i = 0; i < cashierCount; ++i) {
        thread_args[i] = i;
        if (pthread_create(&threads[i], nullptr, checkoutCustomer, (void *) &thread_args[i]) != 0) {
            std::cout << "Error when creating cashier thread.\n";
        }
    }

    // Customer generator threads.
    for (int i = cashierCount; i < cashierCount + generatorCount; ++i) {
        if (pthread_create(&threads[i], nullptr, addCustomerToQueue, nullptr) != 0) {
            std::cout << "Error when creating generator thread.\n";
        }
    }

    // Joining threads.
    for (unsigned long thread: threads) {
        if (pthread_join(thread, nullptr) != 0) {
            std::cout << "Could not join threads.\n";
        }
    }

    cleanup();

    std::cout << "Everyone was checked out.\n";

    return 0;
}
