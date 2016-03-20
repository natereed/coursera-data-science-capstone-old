library("tm")
library("quanteda")

# Read in data
dir <- file.path("~", "Coursera", "Capstone", "final", "en_US")
newsData <- readLines(file.path(dir, "en_US.news.txt"))
blogsData	<- readLines(file.path(dir, "en_US.blogs.txt"))
twitterData	<- readLines(file.path(dir, "en_US.twitter.txt"))

# Sample
sampleSize <- 0.05 ##Set to whatever sample size you want
set.seed(1234)
newsSubSet <- sample(newsData, length(newsData)*sampleSize)
blogsSubSet <- sample(blogsData, length(blogsData)*sampleSize)
twitterSubSet <- sample(twitterData, length(twitterData)*sampleSize)
subSet <- paste(newsSubSet, blogsSubSet, twitterSubSet))

vc <- VCorpus(VectorSource(subSet))
qc <- corpus(vc)
myDfm <- dfm(qc)

#vc <- tm_map(vc, PlainTextDocument)
#vc <- tm_map(vc, removeNumbers)
#vc <- tm_map(vc, stripWhitespace)
#vc <- tm_map(vc, tolower) # This might not be a valid transformation - check the docs
#vc <- tm_map(vc, removePunctuation)
#vc <- tm_map(vc, removeWords, profanewords)

#dtm = DocumentTermMatrix(vc, control=list())

