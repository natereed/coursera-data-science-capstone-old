devtools::install_github('dselivanov/text2vec@0.3')

#library(magrittr)

dir <- file.path("~", "Coursera", "Capstone", "final", "en_US")

blogs_data <- readLines(file.path(dir, "en_US.blogs.txt"))
length(blogs_data);
# [1] 899288

names(blogs_data) <- seq(1, length(blogs_data));

it <- itoken(blogs_data, 
            preprocess_function = tolower, 
            tokenizer = word_tokenizer);
#vocab <- create_vocabulary(it);

#vectorizer <- vocab_vectorizer(vocab)
dtm <- create_dtm(it, vectorizer, type='dgTMatrix')
