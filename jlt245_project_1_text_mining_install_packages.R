
install.packages(c("devtools", "stringr"), repos = "http://cran.us.r-project.org")
library(devtools)

install_github("twitteR", username="geoffjentry")

install.packages(c("tm", "NLP"),repos = "http://cran.us.r-project.org")
install.packages(c("skmeans", "seriation"), repos = "http://cran.us.r-project.org")

# depends on gsl, need to use:
# sudo yum install gsl_devel
# before installing this package.
install.packages(c("topicmodels"), repos = "http://cran.us.r-project.org")

# association analysis.
install.packages(c("gridGraphviz", "slam", "grid", "graph"), repos = "http://cran.us.r-project.org")
source("https://bioconductor.org/biocLite.R")
source("http://bioconductor.org/biocLite.R")
biocLite("graph")
biocLite("Rgraphviz")

# word cloud analysis.
install.packages(c("wordcloud"), repos = "http://cran.us.r-project.org")

capabilities()
