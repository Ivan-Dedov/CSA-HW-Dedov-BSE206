from Creature import Creature


# The bird type of creatures.
class Bird(Creature):
    def __init__(self, name: str, weight: int, does_migrate: bool):
        super().__init__(name, weight)
        self.does_migrate = does_migrate

    def to_string(self) -> str:
        return f"BIRD {{ name = \"{self.name}\"; " \
               f"weight = {self.weight}; " \
               f"does_migrate = {self.does_migrate}; "\
               f"metric = {self.get_metric()} }}"
