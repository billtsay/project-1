
install.packages(c("devtools", "stringr"))
library(devtools)

install_github("twitteR", username="geoffjentry")

install.packages(c("tm", "NLP"))
install.packages(c("skmeans", "seriation"))

# depends on gsl, need to use:
# sudo yum install gsl_devel
# before installing this package.
install.packages(c("topicmodels"))

# association analysis.
install.packages(c("gridGraphviz", "slam", "grid", "graph"))
source("https://bioconductor.org/biocLite.R")
source("http://bioconductor.org/biocLite.R")
biocLite("graph")
biocLite("Rgraphviz")

# word cloud analysis.
install.packages(c("wordcloud"))

capabilities()
