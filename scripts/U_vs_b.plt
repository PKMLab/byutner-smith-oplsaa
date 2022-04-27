#!/usr/bin/env -S gnuplot -c
# Brief: <this_script> <path/to/datfile> <title> <path/to/pngfile> 
# Or, Call this script as :: gnuplot -c <this_script> <path/to/datfile> <title> <path/to/pngfile>
datfile=ARG1
title=ARG2
pngfile=ARG3
print datfile, title, pngfile
set term pngcairo
set output pngfile
stats datfile u 1:2  nooutput
set ylabel "Potential Energy (kJ/mol)"
set xlabel "b (nm)"
set arrow from STATS_pos_min_y, STATS_min_y to STATS_pos_min_y, graph 0
lhead=sprintf("b=%f nm",STATS_pos_min_y)
set label lhead at STATS_pos_min_y, graph 0 offset 0,1
pl datfile u 1:2 w lp t title
set out
