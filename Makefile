CONTAINER_TAG = zmaas/conda-builder

all: images

docker:
	sudo docker build --rm -t ${CONTAINER_TAG} conda-builder

images: docker
	sudo docker run --rm --init \
	-v $(shell pwd)/packages:/to_build \
	--entrypoint=/to_build/build_package.sh \
	${CONTAINER_TAG}
