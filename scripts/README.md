<!-- Preview available at https://markdownlivepreview.com/ -->

# How to generate the topology
- Prepare (CH2CF2)n polymer with n=22(for example), using `polygen 22 > pvdf_beta_22.gro`
- Open `pvdf_beta_22.gro` using Avogadro
- Add terminal H and F - (CH3 and CF3 groups)
- Adjust the bondlengths (put values of other C-H and C-F bonds) in the CH3 and CF3 groups: `View` > `Properties` > `Bond properties`
- Save and quit Avogadro
- Open `pvdf_beta_22.gro` and edit : put the last F in the 22VDF residue and the last 3 Hs into 1VDF instead of 1UNL
- Generate top: `gmx x2top -ff pvdf-cnt -nopbc -noparam -name pvdf_beta_22 -o topol.top -f pvdf_beta_22.gro`
- Generate .itp from `topol.top` if needed
  
# How to generate periodic molecules
- https://gromacs.bioexcel.eu/t/periodic-molecules-infinite-graphene-layer/2021
- https://gromacs.bioexcel.eu/t/infinite-dna-across-boundary-conditions/1628
- https://gromacs.org-gmx-users.maillist.sys.kth.narkive.com/H75XEpG8/gmx-users-polymer-in-periodic-boundary-conditions
  
- Remove all references to atoms belonging to the terminal CH3 and CF3 groups (residue 1 and 22) from both .gro and .top.
- In .top file, when atoms in residue 1 (terminal group) interact with atoms in non-terminal groups, replace atoms in residue 1 
with corresponding atoms in residue 21. Similarly replace atoms in residue 22 with corresponding atoms in residue 2. The 3rd H 
or F in the terminal groups that we added should be ignored completely as it has no correspondence in residue 21 or 2.
- The topology file now needs renumbering of the atoms as atom numbers start from 5. [Download](http://www.gromacs.org/@api/deki/files/62/=gmx_top_tools.tgz) 
`gmx_top_tools.tgz` by Anton Feenstra from Gromacs's User contributions [page](http://www.gromacs.org/Downloads_of_outdated_releases/User_contributions/Other_software).
- Extract the `renumtop` awk script and do `renumtop topol.top > renumbered_topol.top`
- Next we need to prepare the corresponding .gro file. It still has 22 residues and 134 atoms. Also needs renumbering. 
Delete residue 1 and 22, edit the total number of atoms to be 6x20=120, then run `gmx editconf -f old.gro -o new.gro` to 
renumber the atoms. Note that we don't renumber the residues (no `-resnr` option used). This is because the topology file 
still doesn't have the residues renumbered.
- DONOT forget to add `periodic-molecules = yes` in the .mdp file. Otherwise there would be errors while domain decomposition.
