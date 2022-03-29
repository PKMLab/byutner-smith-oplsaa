- Watkins, Edward K., and William L. Jorgensen. “Perfluoroalkanes: Conformational Analysis and Liquid-State Properties from Ab Initio and Monte Carlo Calculations.” The Journal of Physical Chemistry A 105, no. 16 (April 1, 2001): 4118–25. https://doi.org/10.1021/jp004071w.  
- Siu, Shirley W. I., Kristyna Pluhackova, and Rainer A. Böckmann. “Optimization of the OPLS-AA Force Field for Long Hydrocarbons.” Journal of Chemical Theory and Computation 8, no. 4 (April 10, 2012): 1459–70. https://doi.org/10.1021/ct200908r.  
- Byutner, Oleksiy G., and Grant D. Smith. “Quantum Chemistry Based Force Field for Simulations of Poly(Vinylidene Fluoride).” Macromolecules 33, no. 11 (May 1, 2000): 4264–70. https://doi.org/10.1021/ma9918295.
- Sahihi, Mehdi, Andres Jaramillo-Botero, William A. Goddard, and Fahmi Bedoui. “Interfacial Interactions in a Model Composite Material: Insights into α → β Phase Transition of the Magnetite Reinforced Poly(Vinylidene Fluoride) Systems by All-Atom Molecular Dynamics Simulation.” The Journal of Physical Chemistry C 125, no. 39 (October 7, 2021): 21635–44. https://doi.org/10.1021/acs.jpcc.1c05894.  

Download the present directory to your working directory (`git clone ...`). Then `gmx x2top -ff pvdf-cnt`.  
Before applying `gmx x2top` on CNT configs (.pdb or .gro), change the atomtypes `C` and `H` in those configs to `CJ` and `HJ` respectively.  
Also, after generating the topology file with `x2top`, change the function type in the `[dihedrals]` section to `9` for PVDF and `3` for CNT.  
