unigram_hash <- new.env()
ngram_hash <- new.env()

count_n <- function(term) {
  return(length(strsplit(term, '_')[[1]]))
}

extract_lower_order_ngram <- function(ngram) {
  tokens = strsplit(ngram, '_')[[1]]
  return(paste(tokens[1:length(tokens)-1], collapse='_'))
}

update_hash <- function(row) {
  term <- row$terms;
  term_count <- row$term_count; 
  n <- count_n(term)
  
  print(paste("n: ", n))
  # If unigram, update unigram frequency
  if (n == 1) {
    print("Updating unigram hash")
    unigram_hash[[term]] <- term_count  
    return();
  }
  
  print("Getting lower ngram")
  ngram <- extract_lower_order_ngram(term)
  entry <- ngram_hash[[ngram]]
  if(!is.null(entry)) {
    print("Found existing entry")
    # Compare term frequencies
    # What if the term counts are equal? 
    if (term_count > entry[["term_count"]]) {
      ngram_hash[[ngram]] <- list(term=term, term_count=term_count)
    }
  } else {
    print("New entry")
    print(ngram)
    ngram_hash[[ngram]] <- list(term=term, term_count=term_count)
  }
}
  
for (i in 1:nrow(train_subset[0:10])) {
  update_hash(train_subset[i])
}
