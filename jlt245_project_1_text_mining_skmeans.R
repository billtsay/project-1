NAME = "hillary"
library(stringr)

fn = str_c("jlt245_project_1_text_mining_tdm_", NAME, ".RData") 
load(file = fn)

library(tm)

dtm <- as.DocumentTermMatrix(tdm)

# Using Spherical k-Means Clustering
library(skmeans)

set.seed(1234)
(topic <- skmeans(weightBin(dtm), k=10, m=1.2, control=list(nruns=20)))
names(topic)

library("clue")
library("grid")

install.packages("seriation")
library("seriation")

# This chart may take an hour to display.
res <- dissplot(skmeans_xdist(weightBin(dtm)), cl_class_ids(topic), options=list(silhouette=TRUE, gp=gpar(cex=0.7)))
res

plot(res, options = list(main = "Seriation - threshold", threshold = 1.5))
