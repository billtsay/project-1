
install.packages(c("wordcloud", "RColorBrewer"))

NAME = "hillary"
library(stringr)
library(RColorBrewer)

fn = str_c("jlt245_project_1_text_mining_tdm_", NAME, ".RData") 
load(file = fn)

set.seed(201)

dark2 <- brewer.pal(5, "Dark2")

library(wordcloud)

m <- as.matrix(tdm)
wordFreq <- sort(rowSums(m), decreasing = T)
# wordcloud(words = names(wordFreq), freq = wordFreq, min.freq = 50, random.order = F, colors = dark2)
wordcloud(words = names(wordFreq), freq = wordFreq, min.freq = 100, scale = c(5, 2), rot.per=0.5, random.color = T, random.order = F, colors = dark2)

