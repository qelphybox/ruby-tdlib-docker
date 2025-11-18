# Ruby TDLib Docker

## Quick Reference

- **Maintained by**: [kirillbobykin](https://github.com/qelphybox)
- **Where to get help**: [GitHub Issues](https://github.com/qelphybox/ruby-tdlib-docker/issues)
- **Where to file issues**: [GitHub Issues](https://github.com/qelphybox/ruby-tdlib-docker/issues)
- **Source of this description**: [GitHub Repository](https://github.com/qelphybox/ruby-tdlib-docker)

## Supported Tags and Respective `Dockerfile` Links

- [`3.4.7-alpine-tdlib-1.8.35-latest`, `3.4.7-alpine`, `alpine`, `latest`](https://github.com/qelphybox/ruby-tdlib-docker/blob/main/Dockerfile)
- [`3-slim-tdlib-1.8.35-latest`, `3-slim`, `slim`](https://github.com/qelphybox/ruby-tdlib-docker/blob/main/slim.Dockerfile)

## What is Ruby TDLib Docker?

Ruby TDLib Docker provides minimal Docker images containing Ruby, [TDLib](https://github.com/tdlib/td) (Telegram Database Library), and necessary dependencies. These images are useful for running Ruby applications that depend on [tdlib-ruby](https://github.com/tdlib/tdlib-ruby) or building Telegram bots and clients.

TDLib is a cross-platform library for building Telegram clients. This Docker image includes a pre-built version of TDLib compiled from a specific commit, making it easy to get started with Telegram bot development in Ruby.

## How to Use This Image

### Run an Interactive Shell

**Alpine version:**
```bash
docker run --rm -it kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest
```

**Slim version:**
```bash
docker run --rm -it kirillbobykin/ruby-tdlib:3-slim-tdlib-1.8.35-latest
```

### Run a Ruby Script

```bash
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest ruby your-script.rb
```

### Use as Base Image

Create a `Dockerfile` in your project:

```dockerfile
FROM kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["ruby", "app.rb"]
```

### Docker Compose Example

```yaml
services:
  my-tdlib-app:
    image: kirillbobykin/ruby-tdlib:3.4.7-alpine-tdlib-1.8.35-latest
    volumes:
      - .:/app
      - tdlib-session:/root/.tdlib-ruby
    working_dir: /app
    command: ruby app.rb

volumes:
  tdlib-session:
```

## Image Variants

### `alpine` (Recommended)

This is the default image. It's based on the official `ruby:3.4.7-alpine3.22` image and provides:

- **Smallest image size** - Ideal for production deployments
- **Ruby 3.4.7** on Alpine Linux 3.22
- **TDLib 1.8.35** built from commit `9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f`
- **Minimal attack surface** - Alpine uses musl libc instead of glibc

### `slim`

This variant is based on the official `ruby:3-slim` image (Debian-based) and provides:

- **Better compatibility** with Debian packages and libraries
- **Ruby 3** on Debian slim
- **TDLib 1.8.35** built from the same commit as Alpine version
- **Suitable for development** - Easier to install additional Debian packages

## Environment Variables

- `TDLIB_BUILD_PATH` - Path to TDLib build directory (default: `/tdlib/build`)

## Volumes

- `/root/.tdlib-ruby` - Volume for TDLib session storage. Mount this volume to persist session data between container restarts.

## TDLib Build Location

The TDLib build output is located at `/tdlib/build`. You can reference this path when configuring your Ruby application to use TDLib.

## License

This Docker image is licensed under the [MIT License](https://opensource.org/licenses/MIT). TDLib is licensed under the [Boost Software License](https://github.com/tdlib/td/blob/master/LICENSE_1_0.txt). Ruby is licensed under the [Ruby License](https://www.ruby-lang.org/en/about/license.txt).

## See Also

- [TDLib Documentation](https://core.telegram.org/tdlib/docs/)
- [tdlib-ruby Gem](https://github.com/tdlib/tdlib-ruby)
- [Official Ruby Docker Image](https://hub.docker.com/_/ruby)

