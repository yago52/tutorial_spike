### Notebooks

#### [tutorial_spike.ipynb](tutorial_spike.ipynb) - Python
The tutorial used the 20 most representative (from the cluster analysis) PDB entries as a robust example.

- `build_ensemble.py` – download pdb files, build the ensemble of 72 conformations;
- `files/ensemble_sarscov2.ens.npz` – The complete SARS-CoV-2 ensemble used in the article
- `analysis.py` – core analysis done with the ensemble structures
- `files/cov3d` files from the [Cov3d](https://cov3d.ibbr.umd.edu/) withinformation with the PDB-IDs (.csv), the antibody and repectors data(.tsv)
- `lists.py` – organized lists used for the plots 
 
Plots were generated to replicate the ones done in the article in a simple way. 
The last part of the notebook was done to generate outputs ot be used in the R notebook (or .

#### [network.ipynb](network.ipynb) - R
The tutorial build the ensemble of 72 conformation from the 20 most representative structures PDB-IDs as example.
Calculates the ensemble normal modes, performs the dynamical network analysis derived from the ensemble normal modes.

- `pdbids.txt` – pdbids given as output file from the python script
- `df_total.csv` – df_total table output file from the python script
- `./scripts/domains_new.R` – definition of the communities as domains of the protein spike of SARS-CoV-2 for the notebook
- `./scripts/remodel.cna_igraph2.0.3.R` – function from bio3d package.

In the folder `./scripts` one can find a simple .r script `./scripts/networks` or here [network.r](network.r), which can be runned directly from the terminal, as follows:

`R  `

`source ('./scripts/network.r')`

Plots were generated to replicate the ones done in the article in a simple way. 
