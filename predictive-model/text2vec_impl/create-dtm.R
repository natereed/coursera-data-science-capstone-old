# Install the first time: devtools::install_github('dselivanov/text2vec')
library(text2vec)
dir <- file.path("~", "Coursera", "Capstone", "final", "en_US")

blogs_data <- readLines(file.path(dir, "en_US.blogs.txt"))
length(blogs_data);
# [1] 899288

it <- itoken(blogs_data, 
             preprocess_function = tolower, 
             tokenizer = word_tokenizer);
vocab <- create_vocabulary(it, ngram=c(1L, 3L));

vectorizer <- vocab_vectorizer(vocab)

# Reinitialize iterator
it <- itoken(blogs_data, 
             preprocess_function = tolower, 
             tokenizer = word_tokenizer);
dtm <- create_dtm(it, vectorizer, type='dgTMatrix')

# Term frequencies of n-grams that match "real_things"
# Corresponds to all the documents in the corpus
dtm[,c("real_things")]

# Which term frequencies are greater than zero?
which(dtm[,c("real_things")] > 0)

# Get the term frequencies of all n-grams for documents that contain the n-gram "real_things"
dtm[which(dtm[,c("real_things")] > 0),]

