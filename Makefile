IMAGE_NAME := sahilrao/ncsdk
IMAGE_TAG := v4

.PHONY: all clean build

all: clean pull run

pull:
	docker pull $(IMAGE_NAME):$(IMAGE_TAG)

clean:
	docker images $(IMAGE_NAME) | grep -q $(IMAGE_TAG) && docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true
	docker images $(IMAGE_NAME) | grep -q latest && docker rmi $(IMAGE_NAME):latest || true

run:
	docker run -it --net=host --privileged -v /dev:/dev -v /Users/robertodelprete/Desktop/KANYINI/ncsdk/:/home/tc  $(IMAGE_NAME):$(IMAGE_TAG) /bin/sh


