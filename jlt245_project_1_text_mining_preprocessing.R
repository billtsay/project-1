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


# data cleaning and preprocessing.
# read data from csv file.

library(stringr)

csv = str_c("jlt245_project_1_text_mining_dataset_", NAME, ".csv") 
dataFrame = read.csv(csv)
  
names(dataFrame)
dim(dataFrame)
head(dataFrame, 10)
  
#library(tm)
require(tm)
  
tCorpus <- Corpus(VectorSource(dataFrame$text))
  
# randomly choose a content to verify.
tCorpus[[2001]]$content
  
# functions to remove the non-needed items, such as http link, numbers etc.
removeHTTP <- function(x) gsub("http[^[:space:]]*", "", x)
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
  
tCorpus <- tm_map(tCorpus, FUN=content_transformer(removeHTTP), lazy=FALSE)
tCorpus <- tm_map(tCorpus, FUN=content_transformer(tolower), lazy=TRUE)
tCorpus <- tm_map(tCorpus, FUN=content_transformer(removeNumPunct), lazy=TRUE)
  
# some non-needed stopwords...
rdStopwords <- c(setdiff(stopwords("english"), c("r", "big")),
                 "use", "see", "seed", "via", "amp")
  
# run to remove the stopwords.
tCorpus <- tm_map(tCorpus, removeWords, rdStopwords)
tCorpus <- tm_map(tCorpus, stripWhitespace)
  
# make a copy of corpus for use.
copiedCorpus <- tCorpus
  
# steming.
tCorpus <- tm_map(tCorpus, content_transformer(function(x, d)
    paste(stemCompletion(strsplit(stemDocument(x), ' ')[[1]], d), collapse = ' ')), copiedCorpus, lazy=TRUE)
  
# verify if the non-needed items are removed.
tCorpus[[2001]]$content
  
# converting corpus into Term Document Matrix and plot the term frequency chart.
# this may take an hour to execute.
tdm <- TermDocumentMatrix(tCorpus)
  
fn = str_c("jlt245_project_1_text_mining_tdm_", NAME, ".RData") 
save(tdm, file = fn)

