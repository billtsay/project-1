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
library(RColorBrewer)

fn = str_c("jlt245_project_1_text_mining_tdm_", NAME, ".RData") 
load(file = fn)

set.seed(201)

dark2 <- brewer.pal(5, "Dark2")

library(wordcloud)

m <- as.matrix(tdm)
wordFreq <- sort(rowSums(m), decreasing = T)

pdf(str_c("jlt245_project_1_text_mining_wordcloud_", NAME, ".pdf"))
# wordcloud(words = names(wordFreq), freq = wordFreq, min.freq = 50, random.order = F, colors = dark2)
wordcloud(words = names(wordFreq), freq = wordFreq, min.freq = 50, scale = c(5, 2), rot.per=0.5, random.color = T, random.order = F, colors = dark2)

dev.off()
