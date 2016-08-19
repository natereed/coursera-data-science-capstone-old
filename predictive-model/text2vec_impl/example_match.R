# Read in vocab to data.table
# Example:
tfm <- data.table(term=c("age_of_innocence", "age_of_cannon"), freq=c(2,3))

example_input <- 'age of'
expr <- paste(paste('^', example_input, sep=""), sep="_")

matches <- tfm[grep(expr, tfm$term), ]

# Top-ranked term:
matches[1,]$termwith(e, 'age_of_cannon' <- 'age_of_cannon')
