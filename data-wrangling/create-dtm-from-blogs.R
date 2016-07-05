devtools::install_github("kbenoit/quanteda")
library(quanteda)

dir <- file.path("~", "Coursera", "Capstone", "final", "en_US")

blogs_data <- readLines(file.path(dir, "en_US.blogs.txt"))

# Sample
sample_size <- 0.05
set.seed(1234)
blogs_data <- sample(blogs_data, length(blogs_data) * sample_size)

c <- corpus(blogs_data)
tokenized_doc <- tokenize(blogs_data, 
                          removePunct=T,
                          ngrams=8
                          )
my_dfm <- dfm(tokenized_doc)

# TODO: Improve tokenization (see Rpubs), include n-grams up to 8 (1..8)
