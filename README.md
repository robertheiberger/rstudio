# rstudio
Hack for creating an rstudio container to run in ecs.

More details to come.

1. Update Dockerfile. Replace fid with the username you want to use.
2. Build docker image. 
   docker build -t "rstudio/fid" --build-arg BASE_IMAGE=jupyter/scipy-notebook --build-arg JUPYTERHUB_VERSION=0.8.0 .
3. Tage docker build.
   docker tag "rstudio/fid" ACCOUNTID.dkr.ecr.REGION.amazonaws.com/rstudio/fid
4. Push docker build to ecr.
   docker push ACCOUNTID.dkr.ecr.REGION.amazonaws.com/rstudio/fid
5. Create a new ECS cluster.
6. Create, or update, a security group. Add port 8787 to the rules.
7. Create a new task definition.
   Select the container just pushed.
8. Create a new service. Select the task definition just created and security group.


