f = open("input.graph","r")

vertices = []

i = 0
for line in f:
    i+= 1
    vertices += line.strip().split(" ")

vert_nums = []

print(i)
for v in vertices:
    vert_nums.append(int(v))

print(len(vert_nums))

print(max(vert_nums))

f.close()
