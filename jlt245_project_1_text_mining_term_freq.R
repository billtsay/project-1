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

termFreq <- rowSums(as.matrix(tdm))
termFreq <- subset(termFreq, termFreq >= 100)
termDF <- data.frame(term=names(termFreq), freq = termFreq)

library(ggplot2)
ggplot(termDF, aes(x=term, y=freq)) + geom_bar(stat="identity") + xlab("Terms") + ylab("Count") + coord_flip() + 
  theme(axis.text=element_text(size = 7))

ggsave(str_c("jlt245_project_1_text_mining_term_freq_", NAME, ".pdf"))
