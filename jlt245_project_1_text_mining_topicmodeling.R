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
library(ggplot2)
csv = str_c("jlt245_project_1_text_mining_dataset_", NAME, ".csv") 
dataFrame = read.csv(csv)
fn = str_c("jlt245_project_1_text_mining_tdm_", NAME, ".RData") 
load(file = fn)

# Topic Modeling
dtm <- as.DocumentTermMatrix(tdm)
# install.packages("topicmodels")
library(topicmodels)

lda <- LDA(dtm, k = 10)

term <- terms(lda, 6)

(term <- apply(term, MARGIN=2, paste, collapse=", "))

topics <- topics(lda)
topics <- data.frame(date=as.Date(dataFrame$created), topic=topics)
ggplot(topics, aes(date, fill=term[topic])) + geom_density(position = "stack")
ggsave(str_c("jlt245_project_1_text_mining_topics_", NAME, ".pdf"))



