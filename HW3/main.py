import sys
import time

from util import get_from_file, generate, write_to_file, heapsort

if __name__ == '__main__':
    start_time = time.time()

    if len(sys.argv) != 4:
        print("Could not parse input.")
        sys.exit(101)

    # Parsing command line arguments.
    args = sys.argv
    try:
        if args[1] == '-f':
            creatures = get_from_file(args[2])
        elif args[1] == '-r':
            creatures = generate(int(args[2]))
        else:
            raise Exception("Invalid parameters.")
    except Exception as e:
        print(str(e))
        sys.exit(102)

    output_file = args[3]
    print("Creature list filled.\n")

    try:
        write_to_file(output_file, creatures, False)
    except Exception as e:
        print(str(e))
        exit(104)
    print("Written original creatures to file.\n")

    heapsort(creatures)
    print("Creatures sorted.\n")

    try:
        write_to_file(output_file, creatures, True)
    except Exception as e:
        print(str(e))
        exit(105)
    print("Written sorted creatures to file.\n")

    print(f"Total execution time: {time.time() - start_time} s")
