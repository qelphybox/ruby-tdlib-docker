# Ruby Tdlib Docker

![Docker Image Version](https://img.shields.io/docker/v/kirillbobykin/ruby-tdlib)



Minimal Docker images containing Ruby, TDLib, and necessary dependencies.  
Useful for running Ruby applications that depend on [tdlib-ruby](https://github.com/tdlib/tdlib-ruby) or building Telegram bots and clients.

## Available Images

### Alpine Version (Recommended)
- **Image**: `kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest`
- Ruby 3.4.7 based on Alpine 3.22
- Minimal image size
- Ideal for production

### Slim Version (Debian-based)
- **Image**: `kirillbobykin/ruby-tdlib:3-slim-tdlib-1.8.35-latest`
- Ruby 3 based on Debian slim
- Better compatibility with Debian packages
- Suitable for development and testing

## Features

- TDLib built from commit `9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f` (v1.8.35)
- Small image footprint
- Volume for TDLib session storage at `/root/.tdlib-ruby`

## Usage

| Action | Alpine | Slim |
|--------|--------|------|
| **Build** | `make build-image` | `make build-slim-image` |
| **Push** | `make push-image` | `make push-slim-image` |
| **Run** | `make run-image` | `make run-slim-image` |
| **Run interactively** | `docker run --rm -it kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest` | `docker run --rm -it kirillbobykin/ruby-tdlib:3-slim-tdlib-1.8.35-latest` |

> The TDLib build output is at `/tdlib/build`.  
> You can mount your source code and use this image as a base for your own TDLib-dependent apps.

## Example Docker Compose Service

**Alpine version:**
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

**Slim version:**
```yaml
services:
  my-tdlib-app:
    image: kirillbobykin/ruby-tdlib:3-slim-tdlib-1.8.35-latest
    volumes:
      - .:/app
      - tdlib-session:/root/.tdlib-ruby

volumes:
  tdlib-session:
```

## About TDLib

[TDLib](https://github.com/tdlib/td) (Telegram Database Library) is a cross-platform library for building Telegram clients.

---

**Images maintained by [kirillbobykin](https://github.com/qelphybox).** PRs and issues welcome!

