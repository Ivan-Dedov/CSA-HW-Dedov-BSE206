from Creature import Creature


# The animal type of creatures.
class Animal(Creature):
    food_sources = ['CARNIVORE', 'HERBIVORE', 'INSECTIVORE', 'OMNIVORE']

    def __init__(self, name: str, weight: int, food_source: str):
        super().__init__(name, weight)
        if food_source in self.food_sources:
            self.food_source = food_source
        else:
            raise Exception(f"Invalid food source for animal {name}")

    def to_string(self) -> str:
        return f"ANIMAL {{ name = \"{self.name}\"; " \
               f"weight = {self.weight}; "\
               f"food_source = {self.food_source}; "\
               f"metric = {self.get_metric()} }}"
