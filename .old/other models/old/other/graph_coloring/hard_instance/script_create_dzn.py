f = open("input.graph","r")
g = open("output.graph","w")
vertices = []

for line in f:
    g.write("|" + ", ".join(line.strip().split(" ")) + "\n")

print(vertices)

f.close()
g.close()
