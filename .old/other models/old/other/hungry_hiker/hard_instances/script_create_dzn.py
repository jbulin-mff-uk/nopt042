f = open("input.txt","r")
g = open("output.dzn","a")

g.write("\n\n\n\n")
for line in f:
  g.write(line.strip().split(",")[2]+",")


f.close()
g.close()

