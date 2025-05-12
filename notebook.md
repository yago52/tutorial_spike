### Notebooks

#### tutorial_spike.ipynb - Python
The tutorial used the 20 most representative structures pdbids as example.

- `build_ensemble.py` – download pdb files, build ensemble
- `files/ensemble_sarscov2.ens.npz` – complete ensemble used in the article
- `analysis.py` – core analysis done with the structures - the information in the folder cov3d is used here
- `lists.py` – organized lists used for the plots 
 
Plots were generated to replicate the ones done in the article in a simple way. 
The last part of the notebook was done to generate outputs used in the R notebook.

#### network.ipynb - R
The tutorial used the 20 most representative structures pdbids as example.

- `pdbids.txt` – pdbids given as output file from the python script
- `df_total.csv` – df_total table output file from the python script
- `domains_new.R` – definition of the communities as domains of the protein spike of SARS-CoV-2 for the notebook
- `remodel.cna_igraph2.0.3.R` – function from bio3d package obtained directed from the devs via email

Plots were generated to replicate the ones done in the article in a simple way. 
