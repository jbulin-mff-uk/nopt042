# Graph 3-coloring with Python minizinc package

import minizinc, random, sys, time
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from itertools import groupby


model = minizinc.Model('model.mzn')
gecode = minizinc.Solver.lookup('gecode')
   

def test_random_graph(n, p): 
    edges = []   
    
    for i in range(1,n+1):
        for j in range(i+1,n+1):
            if random.random() <= p:
                edges.append([i,j])
    m = len(edges)

    if m > 0:
        inst = minizinc.Instance(gecode, model)
        
        inst['n'] = n
        inst['m'] = m
        inst['edges'] = edges

        tic = time.perf_counter()    
        result = inst.solve()
        if result is None:
            colorable = False
        else:
            colorable = True 
        toc = time.perf_counter()
        t = round(toc-tic,2)
    else:
        colorable = True
        t = 0

    return m, colorable, t


x = []
y = []
colors = []
sizes = []

for i in range(100):
    
    n = random.randint(100,200+1)
    p = 0.6 + random.random()*0.4

    m, colorable, t = test_random_graph(n, p)

    x.append(n)
    y.append(m)
    colors.append(int(colorable))
    sizes.append(t * 100)

    print(f"graph {i}, {n} vertices, {m} edges, colorable: {colorable}")

print(colors)

plt.style.use('seaborn-whitegrid')
plt.scatter(x, y, c=colors, s=sizes, alpha=0.8,
            cmap=matplotlib.colors.ListedColormap(['red', 'green']))

plt.show()







