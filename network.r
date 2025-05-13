#install.packages("devtools")
#devtools::install_bitbucket("Grantlab/bio3d/bio3d-core", ref="core")
#devtools::install_bitbucket("Grantlab/bio3d-nma")
#devtools::install_bitbucket("Grantlab/bio3d-cna")
#install.packages('igraph')

library('bio3d')
#library(bio3d.cna)
#library(bio3d.nma)
library('igraph')

#setwd ('~/tutorial_spike/')
pdbs.table <- read.table('pdbids.txt',header=FALSE,sep='\n', stringsAsFactors = FALSE)
data.total <- read.table('df_total.csv',header = TRUE, sep = ',',stringsAsFactors = FALSE)
rownames(data.total) <- pdbs.table$V1

ids <- as.character(pdbs.table$V1)

files <- paste0('./structures/pdbs_r/',ids, '.pdb')

files

pdbs.all <- pdbaln(files, fit=TRUE)


#modes
print('Calculating the ensemble normal modes. This might take some minutes')
modes <- nma(pdbs.all, subspace =20)

cijs <- dccm(modes)

pca_dccm_ens <- pca.array(cijs$all.dccm)

data.total$colorconf <- with(data.total, ifelse(conformation == 'closed', 'green', 'red'))
print('Plotting the PCA of the DCCMs from the ensemble normal modes')
#options(repr.plot.width=12, repr.plot.height=10)
plot.pca(pca_dccm_ens, col=data.total$colorconf, cex.lab=1.2, cex.axis=1.2, pch=16)

if (interactive()) {
  readline(prompt = "Plot displayed. Close the plot window and press [Enter] to continue.")
  } else {
  print ('Ploting the PCA of DCCMs')} 

cij.close_open <- filter.dccm(cijs, cutoff.cij=0.3, xyz=pdbs.all, fac=data.total$conformation,
                              scut=0, ncore=1) 

nets.close_open <- cna(cij.close_open, cluster.method = 'walk')

source("./scripts/domains_new.R")
source("./scripts/remodel.cna_igraph2.0.3.R")

nnet.feature.close_open <- remodel.cna(nets.close_open, member = membership,col = c("#FF0000", "#bf819e", "#4169e1", "#EFBF04", "#ff8c00", "#985c41", "#706e0c", "#b47804", "#8a2be2","#ffffff","#9acd32","#a52a2a","#008100"),
                                       method="sum", scut=4, normalize=FALSE, col.edge='feature', coledge.cutoff = 0.25)

# Rotated pdb for better view of the networks
pdb.rot <- read.pdb('./files/6vxx_A_rotated_2.pdb') 

cent.close <- layout.cna(nnet.feature.close_open$close, pdb=pdb.rot, k=3)[,1:2]
cent.closefull <- layout.cna(nnet.feature.close_open$close, pdb=pdb.rot, k=3,full = TRUE)[,1:2]
cent.open <- layout.cna(nnet.feature.close_open$open, pdb=pdb.rot, k=3)[,1:2]
cent.openfull <- layout.cna(nnet.feature.close_open$open, pdb=pdb.rot, k=3,full = TRUE)[,1:2]

w_scale <- 0.003
w_close = (E(nnet.feature.close_open$close$community.network)$weight)*w_scale
w_open = (E(nnet.feature.close_open$open$community.network)$weight)*w_scale

options(repr.plot.width=14, repr.plot.height=8)
layout(matrix(c(1:2), 1, 2))
par(mar=c(0.1, 0.1, 3, 0.1))

plot.cna(nnet.feature.close_open$close, layout = cent.close, vertex.label=NA, main="close", vertex.size = V(nnet.feature.close_open$close$community.network)$size*0.3,weights = w_close)
plot(nnet.feature.close_open$open, layout=cent.open, vertex.label=NA,main="open", vertex.size = V(nnet.feature.close_open$open$community.network)$size*0.3, weights = w_open)

