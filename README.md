# tutorial_spike

This repository contains the required files to perform the analysis done for the article. 
<br> <br>

<p align="left">
  <img src="cluster.gif" width="40%">
</p>

### **Structure of the files present in tutorial_spike.tar.gz**

- `tutorial_spike.ipynb` – Notebook with analysis in Python  
- `network.ipynb` – Notebook with analysis in R  
- `scripts/` – Folder with Python and R scripts  
  - `analysis.py`  
  - `build_ensemble.py`  
  - `domains_new.R`  
  - `lists.py`  
  - `network.r`  
  - `remodel.cna_igraph2.0.3.R`  
- `files/` – Folder containing structural files and datasets  
  - `6vxx_A_rotated_2.pdb`  
  - `ensemble_sarscov2.ens.npz`  
  - `cov3d/` – Data used from CoV3D  
    - `data.csv`  
    - `data_antibody.tsv`  
    - `data_receptor.tsv`  
    - `data_antibody.tsv`  
  - `create_env/` – Files to create the Conda environment  
    - `tutorial_artigo.yml`  


### **Structure of the files present in mdenm_spike.tar.gz**
- `mdenm_spike/` – Folder for the MDeNM simulations using NAMD and R  
  - `step4_equilibration.coor`  
  - `step4_equilibration.vel`  
  - `step4_equilibration.xsc`  
  - `cat_rep_ca.sh`  
  - `catdcd_ca.sh`  
  - `config.namd`  
  - `index-ca`  
  - `inputs2.R`  
  - `mdexicter_namd_nm_2.R`  
  - `run_mdenm_namd_2022_2.sh`  
  - `step3_input.psf`  



### **Requirements** 

This repository assumes that you have a working installation of Conda for the analysis in Python (via [Miniconda](https://docs.conda.io/en/latest/miniconda.html) or [Anaconda](https://www.anaconda.com/))


#### **Install Python** 

To set up the Python environment required to run the scripts:

```bash
conda env create -f tutorial_artigo.yml
conda activate tutorial
```

#### **Install R** 

To set up the R environment required to run the scripts outside of the conda enviroment:

```bash
conda deactivate
sudo apt-get install r-base-core
```

#### **Install Bio3D and igraph package**
To obtain the Bio3D package, start R and then type the following line:

```{r, eval = FALSE}
install.packages("bio3d", dependecies=TRUE)
install.packages("igraph", dependecies=TRUE)
```

#### **Install NAMD** 
Download the [NAMD executable](http://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD). 

To call NAMD from R/Bio3D, we advise users to edit the bash_profile file entering the place where the namd2 executable is found:

```{r, eval = FALSE}
export PATH="/path-to-namd-executable/:$PATH" 
```


inputs - python and R


