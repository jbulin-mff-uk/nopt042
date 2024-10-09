#! /bin/bash
picat graph-coloring "[{1,2},{2,3},{3,4},{4,1}]"
picat graph-coloring "[{1,2},{2,3},{3,1}]" 4
picat graph-coloring "{{0,1,1},{1,0,1},{1,1,0}}" 4
picat graph-coloring -n "[{1,2},{2,3},{3,4},{4,1}]"