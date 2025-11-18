build-image:
	docker build . -t kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest

push-image:
	docker push kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest

run-image:
	docker run --rm -it kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest

build-slim-image:
	docker build -f slim.Dockerfile . -t kirillbobykin/ruby-tdlib:3-slim-tdlib-1.8.35-latest

push-slim-image:
	docker push kirillbobykin/ruby-tdlib:3-slim-tdlib-1.8.35-latest

run-slim-image:
	docker run --rm -it kirillbobykin/ruby-tdlib:3-slim-tdlib-1.8.35-latest
