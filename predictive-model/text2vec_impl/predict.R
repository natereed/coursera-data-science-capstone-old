#devtools::install_github('dselivanov/text2vec')
library(text2vec)
dir <- file.path("C:/", "Users", "Owner", "Projects", "Coursera", "Data Science Capstone", "final", "en_US")

blogs_data <- readLines(file.path(dir, "en_US.blogs.txt"))
length(blogs_data);
# [1] 899288

it <- itoken(blogs_data, 
             preprocess_function = tolower, 
             tokenizer = word_tokenizer);
vocab <- create_vocabulary(it, ngram=c(1L, 3L));

vectorizer <- vocab_vectorizer(vocab)

