install.packages("aws.s3", repos = c("cloudyr" = "http://cloudyr.github.io/drat")) 
install.packages("aws.ec2metadata")

library("aws.s3")
library("aws.ec2metadata")

Sys.setenv("AWS_ACCESS_KEY_ID" = "<PUT-ACCESS-KEY>","AWS_SECRET_ACCESS_KEY" = "<PUT-SECRET-KEY>")
usercsvobj <-get_object("s3://charlesbuckets31/FolderA/users.csv")
csvcharobj <- rawToChar(usercsvobj)
con <- textConnection(csvcharobj) 
data <- read.csv(con) 
close(con) 

data


is_ec2()
instance_document()
metadata
is_ecs()
ecs_metadata(base_url = "http://169.254.170.2")


## Not run:
if (is_ec2()) {
metadata$versions()
metadata$items()
# get instance id
metadata$instance_id()
# get ami id
metadata$ami_id()
# get IAM role (NULL if none specified)
metadata$iam_info()
metadata$iam_role("myrole")
# get an arbitrary metadata item
metadata$item("meta-data/placement/availability-zone")
# get region from instance identity document
instance_document()$region
}
# Can also get ECS container metadata
if (is_ecs()) {
# Get ECS role credentials
metadata$ecs_task_role()
# or
ecs_metadata()
}
