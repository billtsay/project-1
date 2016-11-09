The version of R runtime I am using for this project is R3.3.1. There are some updates and compabilities issues in R3.3.2 that I have not yet investigated. R3.3.1 is the current version that you can use yum to install from Centos repositories.

First of All, before running any R scripts, we need to install the needed packages. Please run:

  Rscript jlt245_project_1_text_mining_install_packages.R

It must be executed without any errors and the capabilities should be as below:

  The downloaded source packages are in
  	‘/tmp/RtmpMH5dWL/downloaded_packages’
       jpeg         png        tiff       tcltk         X11        aqua 
       TRUE        TRUE        TRUE        TRUE        TRUE       FALSE 
   http/ftp     sockets      libxml        fifo      cledit       iconv 
       TRUE        TRUE        TRUE        TRUE       FALSE        TRUE 
        NLS     profmem       cairo         ICU long.double     libcurl 
       TRUE       FALSE        TRUE        TRUE        TRUE        TRUE 
 

The X11 must be TRUE since we will use plot to generate graphs and charts etc.

**R scripts:

 jlt245_project_1_text_mining_install_packages.R 
 jlt245_project_1_text_mining_dataload.R 
 jlt245_project_1_text_mining_preprocessing.R
 jlt245_project_1_text_mining_term_freq.R 
 jlt245_project_1_text_mining_association.R
 jlt245_project_1_text_mining_hclust.R
 jlt245_project_1_text_mining_wordcloud.R
 jlt245_project_1_text_mining_topicmodeling.R
 jlt245_project_1_text_mining_skmeans.R


* jlt245_project_1_text_mining_install_packages.R

To install all libraries that will be needed for this project.

How to Run:

  Rscript jlt245_project_1_text_mining_install_packages.R 


* jlt245_project_1_text_mining_dataload.R

To load the dataset of tweets from twitter.com. It will generate three csv files as below:

  jlt245_project_1_text_mining_dataset_election.csv
  jlt245_project_1_text_mining_dataset_trump.csv
  jlt245_project_1_text_mining_dataset_hillary.csv

with filters "Election 2016", "Donald Trump" and "Hillary Clinton". Each has 6000 tweets. The project will analyze them by using text mining technics.

How to Run:

  Rscript jlt245_project_1_text_mining_dataload.R


* jlt245_project_1_text_mining_preprocessing.R

To prep-process the datasets collected from above dataload script and generate tdm(term document matrix) files:

  jlt245_project_1_text_mining_tdm_election.RData
  jlt245_project_1_text_mining_tdm_trump.RData
  jlt245_project_1_text_mining_tdm_hillary.RData

Those files are the starting documents to procceed the analysis of this project.

How to Run:

  Rscript jlt245_project_1_text_mining_preprocessing.R election
  Rscript jlt245_project_1_text_mining_preprocessing.R hillary
  Rscript jlt245_project_1_text_mining_preprocessing.R trump


* jlt245_project_1_text_mining_term_freq.R

To generate term frequency graph from tdm files:

  jlt245_project_1_text_mining_term_freq_election.pdf
  jlt245_project_1_text_mining_term_freq_hillary.pdf
  jlt245_project_1_text_mining_term_freq_trump.pdf

How to Run:

  Rscript jlt245_project_1_text_mining_term_freq.R election
  Rscript jlt245_project_1_text_mining_term_freq.R hillary
  Rscript jlt245_project_1_text_mining_term_freq.R trump


* jlt245_project_1_text_mining_association.R

To generate team association charts from tdm files:

  jlt245_project_1_text_mining_association_election.pdf  
  jlt245_project_1_text_mining_association_hillary.pdf 
  jlt245_project_1_text_mining_association_trump.pdf   

How to Run:

  Rscript jlt245_project_1_text_mining_association.R election
  Rscript jlt245_project_1_text_mining_association.R hillary
  Rscript jlt245_project_1_text_mining_association.R trump


* jlt245_project_1_text_mining_hclust.R

To generate hierachy clusters of terms:

  jlt245_project_1_text_mining_hclust_election.pdf
  jlt245_project_1_text_mining_hclust_hillary.pdf   
  jlt245_project_1_text_mining_hclust_trump.pdf  

How to Run:

  Rscript jlt245_project_1_text_mining_hclust.R election
  Rscript jlt245_project_1_text_mining_hclust.R hillary
  Rscript jlt245_project_1_text_mining_hclust.R trump


* jlt245_project_1_text_mining_wordcloud.R

To generate term word cloud:

  jlt245_project_1_text_mining_wordcloud_election.pdf
  jlt245_project_1_text_mining_wordcloud_trump.pdf
  jlt245_project_1_text_mining_wordcloud_hillary.pdf


The discussion of these two scripts will leave to project-2:

 jlt245_project_1_text_mining_topicmodeling.R
 jlt245_project_1_text_mining_skmeans.R
  

References:

Data Mining Applications with R 1st Edition by Yanchang Zhao, Yonghua Cen

Analysing Twitter Data with Text Mining and Social Network Analysis by Yanchang Zhao http://crpit.com/confpapers/CRPITV146Zhao.pdf

Getting Things in Order: An Introduction to the R Package seriation by Michael Hahsler, Kurt Hornik, Christian Buchta, https://cran.r-project.org/web/packages/seriation/vignettes/seriation.pdf

Hands-On Data Science with R Text Mining by Graham.Williams@togaware.com, http://onepager.togaware.com/TextMiningO.pdf











