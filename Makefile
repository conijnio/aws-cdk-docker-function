.DEFAULT_GOAL:=help


.PHONY: help
help:  ## Display this help
	$(info Example Makefile for my blog post)
	awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: build
build:  ## Build the hello-world function locally
	docker build --platform linux/arm64 \
		-t hello-world:latest \
		-f ./lib/functions/hello-world/Dockerfile \
		./lib/functions/hello-world

.PHONY: run
run: build ## Build and run the hello-world function locally
	docker run --platform linux/arm64 -p 9000:8080 hello-world:latest

.PHONY: invoke
invoke:  ## Invoke the hello-world function locally
	curl http://localhost:9000/2015-03-31/functions/function/invocations -d '{"name": "Joris"}'

.PHONY: deploy
deploy:
	cdk deploy

 $(VERBOSE).SILENT: