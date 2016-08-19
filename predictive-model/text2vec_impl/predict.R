library(feather)

predict_next_word <- function(input, n) {
  tokens <- strsplit(input, "_")[[1]]
  start_index <- (length(tokens) - n + 1)
  end_index <- length(tokens)
  begin_seq <- tokens[start_index : length(tokens)]
  
  # Get mtaches for higher order n-gram given begin_seq
  
}

vocab_dt <- read_feather("vocab.feather")

# Example text

actual_input <- "It's hot as fuck in this apartment"

# TODO: We need to standardize test strings using the same rules for cleaning
# Use the text2vec package to clean these and dump them to a file?
test_input <- "it's_hot_as_fuck_in_this"


