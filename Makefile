
USERNAME=elct9620
BUILD_IMAGE_NAME=mrb-alpine-builder
IMAGE_NAME=mrb-alpine-runner
WORKING_DIR=`pwd`

DOCKER_BUILD_IMAGE=${USERNAME}/${BUILD_IMAGE_NAME}
DOCKER_IMAGE=${USERNAME}/${IMAGE_NAME}

all: run

prepare:
	@echo "Prepare build environment..."
	@docker build -t ${DOCKER_BUILD_IMAGE} build > /dev/null

run: compile
	@echo "Starting program..."
	@echo ""
	@docker build -t ${DOCKER_IMAGE} . > /dev/null
	@docker run --rm -it ${DOCKER_IMAGE} ${ARGS}

compile: prepare
	@echo "Compile ruby code..."
	@docker run --rm -v $(WORKING_DIR)/bin:/build/bin -v ${WORKING_DIR}/src:/build/src ${DOCKER_BUILD_IMAGE}


