from random import randint

from Animal import Animal
from Bird import Bird
from Creature import Creature
from Fish import Fish


def get_from_file(filename: str) -> list:
    creatures = []
    with open(filename, "r") as file:
        for line in file:
            items = line.split()
            # Animal
            if int(items[2]) == 1:
                creatures.append(Animal(items[0], int(items[1]), Animal.food_sources[int(items[3]) - 1]))
            # Bird
            elif int(items[2]) == 2:
                creatures.append(Bird(items[0], int(items[1]), items[3] != "0"))
            # Fish
            elif int(items[2]) == 3:
                creatures.append(Fish(items[0], int(items[1]), Fish.habitats[int(items[3]) - 1]))
            else:
                raise Exception("Unknown creature.")

    return creatures


def generate_creature(index) -> Creature:
    animal_type = randint(0, 2)
    if animal_type == 0:
        return Animal(str(index), randint(1, 100000), Animal.food_sources[randint(0, 3)])
    elif animal_type == 1:
        return Bird(str(index), randint(1, 100000), bool(randint(0, 1)))
    elif animal_type == 2:
        return Fish(str(index), randint(1, 100000), Fish.habitats[randint(0, 2)])
    else:
        raise Exception(f"Unknown creature type at index {index}.")


def generate(count: int) -> list:
    if count > 10000:
        count = 10000

    if count < 0:
        raise Exception("Count cannot be negative.")

    creatures = []
    for i in range(count):
        creatures.append(generate_creature(i))
    return creatures


def write_to_file(filename: str, items: list, append: bool):
    try:
        if append:
            file = open(filename, "a")
            file.write(f"Sorted data contains {len(items)} elements:\n")
        else:
            file = open(filename, "w")
            file.write(f"Original data contains {len(items)} elements:\n")

        for item in items:
            file.write(item.to_string() + "\n")
        file.write("\n")

    except Exception as e:
        raise e

    finally:
        file.close()


def heapify(items, length, index):
    smallest = index
    left = 2 * index + 1
    right = 2 * index + 2

    if left < length and items[left] < items[smallest]:
        smallest = left
    if right < length and items[right] < items[smallest]:
        smallest = right

    if smallest != index:
        items[index], items[smallest] = items[smallest], items[index]
        heapify(items, length, smallest)


def heapsort(items: list):
    for i in range(int(len(items) / 2) - 1, -1, -1):
        heapify(items, len(items), i)

    for i in range(len(items) - 1, -1, -1):
        items[0], items[i] = items[i], items[0]
        heapify(items, i, 0)
