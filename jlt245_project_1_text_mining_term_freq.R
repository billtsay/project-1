NAME = "trump"
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

