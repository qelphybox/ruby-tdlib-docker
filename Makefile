build-image:
	docker build . -t kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest

push-image:
	docker push kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest

run-image:
	docker run --rm -it kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest
