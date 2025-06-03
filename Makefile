# Define the image name for Docker
IMAGE_NAME = fahdnaveed/fahdnaveedpvt

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
	docker login -u $${DOCKERHUB_USERNAME} -p $${DOCKERHUB_TOKEN}
	docker push $(IMAGE_NAME):$(TAG)-api
