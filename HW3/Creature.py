from abc import ABC, abstractmethod


# Base class for all creatures.
class Creature(ABC):
    # Initializes a new instance of creature.
    def __init__(self, name: str, weight: int):
        self.name = name
        self.weight = weight
        if self.weight <= 0:
            raise Exception("Incorrect creature weight.")

    # Returns the metric of a creature.
    def get_metric(self) -> float:
        name_char_sum = 0.0
        for letter in self.name:
            name_char_sum += ord(letter)
        return name_char_sum / self.weight

    @abstractmethod
    def to_string(self) -> str:
        pass

    def __lt__(self, other) -> bool:
        return self.get_metric() < other.get_metric()

    def __gt__(self, other) -> bool:
        return self.get_metric() > other.get_metric()

    def __le__(self, other) -> bool:
        return self.get_metric() <= other.get_metric()

    def __ge__(self, other) -> bool:
        return self.get_metric() >= other.get_metric()

    def __eq__(self, other) -> bool:
        return self.get_metric() == other.get_metric()

    def __ne__(self, other) -> bool:
        return self.get_metric() != other.get_metric()
