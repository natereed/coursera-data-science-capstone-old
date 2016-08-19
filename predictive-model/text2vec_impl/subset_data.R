setwd( file.path("C:/", "Users", "Owner", "Projects", "Coursera", "Data Science Capstone"))

dir <- file.path("final", "en_US")
news_data <- readLines(file.path(dir, "en_US.news.txt"))
blogs_data  <- readLines(file.path(dir, "en_US.blogs.txt"))
twitter_data    <- readLines(file.path(dir, "en_US.twitter.txt"))

sample_size <- 0.05
set.seed(1234)
news_subset <- sample(news_data, length(news_data) * sample_size)
rm(news_data)

blogs_subset <- sample(blogs_data, length(blogs_data) * sample_size)
rm(blogs_data)

twitter_subset <- sample(twitter_data, length(twitter_data) * sample_size)
rm(twitter_data)

combined_doc <- sample(c(news_subset, blogs_subset, twitter_subset))
rm(news_subset, blogs_subset, twitter_subset)

write(combined_doc, file="combined_doc.txt")
