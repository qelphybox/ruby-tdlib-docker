# Ruby Tdlib Docker

![Docker Image Version](https://img.shields.io/docker/v/kirillbobykin/ruby-tdlib)



A minimal Docker image containing Ruby 3.4.7, Alpine, and [TDLib](https://github.com/tdlib/td).  
Useful for running Ruby applications that depend on [tdlib-ruby](https://github.com/tdlib/tdlib-ruby) or building Telegram bots and clients.

## Features

- Ruby 3.4.7 (Alpine 3.22)
- TDLib built from commit `9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f` (v1.8.35)
- Small image footprint
- Volume for TDLib session storage at `/root/.tdlib-ruby`

## Usage

### Build the Image

```sh
make build-image
```

### Push the Image (to Docker Hub)

```sh
make push-image
```

### Run the Image

```sh
make run-image
```

### Run Interactively

```sh
docker run --rm -it kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest
```

> The TDLib build output is at `/tdlib/build`.  
> You can mount your source code and use this image as a base for your own TDLib-dependent apps.

## Example Docker Compose service

```yaml
services:
  my-tdlib-app:
    image: kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest
    volumes:
      - .:/app
      - tdlib-session:/root/.tdlib-ruby

volumes:
  tdlib-session:
```

## About TDLib

[TDLib](https://github.com/tdlib/td) (Telegram Database Library) is a cross-platform library for building Telegram clients.

---

**Image maintained by [kirillbobykin](https://github.com/qelphybox).** PRs and issues welcome!

