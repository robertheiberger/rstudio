install.packages("aws.s3", repos = c("cloudyr" = "http://cloudyr.github.io/drat")) 
library("aws.s3")

Sys.setenv("AWS_ACCESS_KEY_ID" = "<PUT-ACCESS-KEY>","AWS_SECRET_ACCESS_KEY" = "<PUT-SECRET-KEY>")
usercsvobj <-get_object("s3://charlesbuckets31/FolderA/users.csv")
csvcharobj <- rawToChar(usercsvobj)
con <- textConnection(csvcharobj) 
data <- read.csv(con) 
close(con) 

data
