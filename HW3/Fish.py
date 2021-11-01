from Creature import Creature


# The fish type of creatures.
class Fish(Creature):
    habitats = ["LAKE", "RIVER", "SEA"]

    def __init__(self, name: str, weight: int, habitat: int):
        super().__init__(name, weight)
        if 1 <= habitat <= len(self.habitats):
            self.habitat = self.habitats[habitat - 1]
        else:
            raise Exception(f"Invalid habitat for bird {name}")

    def to_string(self) -> str:
        return f"FISH {{ name = \"{self.name}\"; " \
               f"weight = {self.weight}; " \
               f"habitat = {self.habitat}; " \
               f"metric = {self.get_metric()} }}"
