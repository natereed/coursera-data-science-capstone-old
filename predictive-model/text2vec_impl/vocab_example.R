vocab[[1]]$terms

# Exact match of "real_things"
vocab[[1]][which(vocab[[1]]$terms == c("real_things"))]

# Grep for pattern /real_things_/
matching_terms <- arrange(vocab[[1]][grep("^real_things_", vocab[[1]]$terms)], desc(terms_counts))
highest_ranking_term <- matching_terms$terms[1]

# Using dl
# Find one with the highest terms_count

#terms terms_counts doc_counts
#1: real_things            1          1

# Get the count?

# Find the 3-gram that starts with the given terms and occurs most frequently
find_matching_ngram <- function(n1, n2) {
  expr <- paste(paste("^", paste(n1, n2, sep="_"), sep=""), "_", sep="")
  matching_terms <- vocab[[1]][grep(expr, 
                                    vocab[[1]]$terms)]
  if (length(matching_terms$terms) > 0) {
    return(arrange(matching_terms, desc(terms_counts))$terms[1])
  } else {
    return(NULL);
  }
}

find_next_word <- function(sentence) {
      
}

# Usage:
#> find_matching_ngram("real", "things")
#[1] "real_things_that"
#> find_matching_ngram("the", "thing")
#[1] "the_thing_is"

# Given the index of a matching term:
vocab[[1]]$terms_counts[9999]
vocab[[1]]$terms[9999]

e <- new.env()
with(e, 'age_of_cannon' <- 2)
# Use hash table (environment)
e[[names(e)[grep('^age_of_', names(e))]]]

