# Define the image name for Docker
IMAGE_NAME = fahdnaveed/fahdnaveedpvt
DOCKERHUB_USERNAME1=fahdnaveed
DOCKERHUB_TOKEN1=dckr_pat_MuZDNT93pU9b-FoMpVYHqmS5td4
# Define the tag for Docker
TAG = mylera
.PHONY: all build tag push login clean release-api build-api push-api
all:	release-api

release-api: build-api push-api

# This is a Makefile target named 'build'
build-api: 
	docker buildx build --platform linux/amd64 --tag $(IMAGE_NAME):$(TAG)-api -f docker/Dockerfile-api .
	
# This is a Makefile target named 'push'
push-api: 
  #@echo "Logging in to Push Docker images..."	
  docker login -u $(DOCKERHUB_USERNAME1) -p $(DOCKERHUB_TOKEN1)
  #@echo "Pushing Docker images..."
	docker push $(IMAGE_NAME):$(TAG)-api
