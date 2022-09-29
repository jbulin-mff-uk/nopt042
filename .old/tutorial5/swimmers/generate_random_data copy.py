import numpy as np
import sys


def main(n, m):

    with open(f"data{n}-{m}.dzn", 'w') as file:
        file.write(f"SWIMMER = anon_enum({n});\n")
        file.write(f"STYLE = anon_enum({m});\n")
        #np.random.seed(42)
        time = np.random.randint(60, size=(n,m)).tolist()
        file.write("time = [|")
        for row in time:
            file.write("\n" + str(row)[1:-1] + " |")
        file.write("];")


if __name__ == "__main__":
    main(int(sys.argv[1]), int(sys.argv[2]))