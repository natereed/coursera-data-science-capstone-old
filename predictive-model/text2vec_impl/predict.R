get_regex <- function(input) {

    return(paste(paste("^", input, sep=""), "_", sep=""))
}

count_n <- function(term) {
  return(length(strsplit(term, '_')[[1]]))
}

filter_matches <- function(n, matching_terms) {
  matching_terms <- mutate(matching_terms, n=length(strsplit(terms, '_')[[1]]))
  match <- arrange(matching_terms, n, desc(term_count))$terms[1]
  return(match)
}

find_matching_ngrams <- function(vocab, input) {
  expr <- get_regex(input)
  print(expr)
  matching_terms <- vocab[grep(expr, vocab$terms)]
  if (length(matching_terms) > 0) {
    print("Found matches")
    #print(matching_terms$terms)
    return(filter_matches(count_n(input), 
                          matching_terms))
  } else {
    return(NULL);
  }
}

#library(feather)
#train_dt <- read_feather("train.feather")

test_obs <- test_subset[sample(nrow(test_subset), 1)]

for (index in 1:nrow(test_obs)) {
  term <- test_obs[index,]$terms
  print(paste("Term: ", term))
  t = proc.time()
  
  val <- find_matching_ngrams(vocab_dt, term)
  print(paste("Prediction: ", val))
  time <- proc.time() - t
  print(time[['elapsed']])
}

