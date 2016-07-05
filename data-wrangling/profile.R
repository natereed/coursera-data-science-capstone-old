# Download
if (!file.exists("Coursera-SwiftKey.zip")) {
  download.file(paste("https://d396qusza40orc.cloudfront.net",
                      "/dsscapstone/dataset/Coursera-SwiftKey.zip"),
                "Coursera-SwiftKey.zip");
}

unzip("Coursera-SwiftKey.zip");

ptm <- proc.time();
dir <- file.path("~", "Coursera", "Capstone", "final", "en_US")
news_data <- readLines(file.path(dir, "en_US.news.txt"))
blogs_data <- readLines(file.path(dir, "en_US.blogs.txt"))
twitter_data <- readLines(file.path(dir, "en_US.twitter.txt"))
proc.time() - ptm;

