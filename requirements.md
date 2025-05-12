### **Requirements** 

This repository assumes that you have a working installation of Conda for the analysis in Python (via [Miniconda](https://docs.conda.io/en/latest/miniconda.html) or [Anaconda](https://www.anaconda.com/))


#### **Install Python** 

To set up the Python environment required to run the scripts:

```bash
conda env create -f tutorial_artigo.yml
conda activate tutorial
```

#### **Install R** 

To set up the R environment required to run the scripts:

- Go outside of conda enviromment:

```bash
conda deactivate
```

- R installation:
```bash
sudo apt-get install r-base-core
```

#### **Install Bio3D and igraph package**
To obtain the Bio3D and igraph package, start R and then type the following line:

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

#### **Install jupyter notebook**
To run the notebooks is necessary to have a reader of .ipynb, we recomend use of jupyter notebook for that:

- For Python - conda enviromment:

```bash
conda install jupyter
```

- For R - outside enviromment:

```bash
pip install jupyter
```  

