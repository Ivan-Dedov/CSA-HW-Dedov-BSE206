from Creature import Creature


# The fish type of creatures.
class Fish(Creature):
    habitats = ['LAKE', 'RIVER', 'SEA']

    def __init__(self, name: str, weight: int, habitat: str):
        super().__init__(name, weight)
        if habitat in self.habitats:
            self.habitat = habitat
        else:
            raise Exception(f"Invalid habitat for bird {name}")

    def to_string(self) -> str:
        return f"FISH {{ name = \"{self.name}\"; " \
               f"weight = {self.weight}; " \
               f"habitat = {self.habitat}; " \
               f"metric = {self.get_metric()} }}"
