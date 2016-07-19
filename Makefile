.PHONY: build release dev

NAME=mvantellingen/registrator-route53
VERSION=latest

dev:
	docker build -f Dockerfile.dev -t $(NAME):dev .
	docker run --rm \
		-v /var/run/docker.sock:/tmp/docker.sock \
		$(NAME):dev /bin/registrator consul:

build:
	mkdir -p build
	docker build -t $(NAME):$(VERSION) .

release:
	docker push $(NAME):$(VERSION)
