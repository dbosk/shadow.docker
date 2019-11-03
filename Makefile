.PHONY: all docker
#all: docker

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
	${RM} shadow.pdf
	${RM} Dockerfile.tex


INCLUDE_MAKEFILES=.
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/tex.mk
