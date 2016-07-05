library(text2vec)

# Load blogs
dir <- file.path("~", "Coursera", "Capstone", "final", "en_US")
blogs_data <- readLines(file.path(dir, "en_US.blogs.txt"))

# Take a small sample
#sample_size <- 0.05
#set.seed(1234)
#blogs_data <- sample(blogs_data, length(blogs_data) * sample_size)

# Create vocabulary of n-grams (we'll use 1 to 3 word n-grams)
it <- itoken(blogs_data, 
             preprocess_function = tolower, 
             tokenizer = word_tokenizer);
vocab <- create_vocabulary(it, ngram=c(1L, 3L));

# Ditties
# Find observations with terms_counts more than 1, sorted in descending order by terms_counts
filter(vocab[[1]], terms_counts > 1) %>% arrange(desc(terms_counts))


