docker-build:
	docker build -t kaggle_base -f docker/Dockerfile .

docker-run:
	docker run -it --rm -p 8888:8888 -v ${PWD}:/work kaggle_base /bin/bash
