.PHONY: all docker
all: Dockerfile.pdf docker

NOWEAVEFLAGS=-latex


DOCKER_ID_USER?=dbosk

docker: Dockerfile
	docker build -t shadow .
	docker tag shadow ${DOCKER_ID_USER}/shadow

.PHONY: push
push: docker
	docker push ${DOCKER_ID_USER}/shadow

Dockerfile: Dockerfile.nw
	notangle -t2 -R$@ $^ | cpif $@


.PHONY: distclean
distclean:
	docker image rm shadow
	docker image rm ${DOCKER_ID_USER}/shadow

.PHONY: clean
clean:
	${RM} Dockerfile.pdf Dockerfile.tex


INCLUDE_MAKEFILES=.
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/tex.mk
