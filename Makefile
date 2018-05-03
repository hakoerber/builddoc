REGISTRY := registry.haktec.de
APPNAME := builddoc
PUSHURL := $(REGISTRY)/$(APPNAME)

.PHONY: all
all: | image push

.PHONY: image
image:
	docker build \
		--tag $(PUSHURL) \
		--tag $(PUSHURL):master \
		--tag $(PUSHURL):$${DRONE_COMMIT_BRANCH} \
		--tag $(PUSHURL):$${DRONE_COMMIT_SHA} \
		-f Dockerfile .

.PHONY: push
push:
	docker push $(PUSHURL)
