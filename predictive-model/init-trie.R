trie <- new.env()

probability_of <- function(term) {
  return(1);
}

insert <- function(ngram) {
  term <- ngram$terms
  term_count <- ngram$term_count # TBD: Replace this with p in ngram
  tokens <- strsplit(term, '_')[[1]]  
  n <- length(tokens)
  
  node <- trie
  for (i in 1:n) {
    token <- tokens[i]

    entry <- node[[token]]
    if (is.null(entry)) {
      entry <- new.env()
      node[[token]] <- entry
      node <- entry
    }
    # Last entry?
    if (i == n) {
      entry[['p']] = probability_of(term)
    }
  }
}

print_trie <- function(trie, level=1) {
  names <- names(trie)
  indent <- paste(rep('    ', level - 1), sep="", collapse="")
  for (name in names) {
    print(paste(indent, name, sep=""))
    val <- trie[[name]]
    if (typeof(val) == 'environment') {
      print_trie(val, level=level+1)
    } else {
      print(paste(indent, name, ": ", val, sep=""))
    }
  }
}

for (i in 1:nrow(train_subset[0:10])) {
  insert(train_subset[i])
}

