devtools::install_github('dselivanov/text2vec')
dir <- file.path("~", "Coursera", "Capstone", "final", "en_US")

blogs_data <- readLines(file.path(dir, "en_US.blogs.txt"))
length(blogs_data);
# [1] 899288

it <- itoken(blogs_data, 
             preprocess_function = tolower, 
             tokenizer = word_tokenizer);
vocab <- create_vocabulary(it, ngram=c(1L, 8L));

vectorizer <- vocab_vectorizer(vocab)

