NAME = "trump"

install.packages(c("gridGraphviz", "slam", "grid"))

library(stringr)
library(tm)

fn = str_c("jlt245_project_1_text_mining_tdm_", NAME, ".RData") 
load(file = fn)

# Associations
findAssocs(tdm, "trump", 0.2)
findAssocs(tdm, "hillary", 0.2)

source("https://bioconductor.org/biocLite.R")
biocLite("graph")

library(graph)

source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")

library(gridGraphviz)

library(Rgraphviz)

(freqTerms <- findFreqTerms(tdm, lowfreq = 200)[1:50])

plot(tdm, terms=freqTerms, corThreshold=0.1, weighting=T)

