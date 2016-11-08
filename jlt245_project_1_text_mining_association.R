#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("One argument must be supplied (input file).n", call.=FALSE)
}

# This script will run three times with NAME = "election", "hillary" and "trump", and generates TDM files for each.
NAME = args[1]    

# NAME = "election"
# NAME = "hillary"
# NAME = "trump"

setwd("~/project-1")


library(stringr)
library(tm)

fn = str_c("jlt245_project_1_text_mining_tdm_", NAME, ".RData") 
load(file = fn)

# Associations
findAssocs(tdm, "trump", 0.2)
findAssocs(tdm, "hillary", 0.2)

# source("https://bioconductor.org/biocLite.R")

library(graph)
library(gridGraphviz)
library(Rgraphviz)

(freqTerms <- findFreqTerms(tdm, lowfreq = 200)[1:25])

pdf(str_c("jlt245_project_1_text_mining_association_", NAME, ".pdf"))
plot(tdm, terms=freqTerms, corThreshold=0.1, weighting=T)

dev.off() 
