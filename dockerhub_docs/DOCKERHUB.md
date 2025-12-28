# Ruby TDLib Docker

## Quick Reference

- **Maintained by**: [kirillbobykin](https://github.com/qelphybox)
- **Where to get help**: [GitHub Issues](https://github.com/qelphybox/ruby-tdlib-docker/issues)
- **Where to file issues**: [GitHub Issues](https://github.com/qelphybox/ruby-tdlib-docker/issues)
- **Source of this description**: [GitHub Repository](https://github.com/qelphybox/ruby-tdlib-docker)

## Supported Tags and Respective `Dockerfile` Links

The project builds images for **Ruby 4.0, 3.4, 3.3, 3.2** on **Alpine, Debian Slim, and Debian Bookworm**.

All tags are available in two forms:
1. Short (e.g., `3.4-alpine`)
2. With TDLib version suffix (e.g., `3.4-alpine-tdlib-1.8.35`)

### List of Major Tags

- [`latest`, `4.0-trixie`, `4.0`, `4`](https://github.com/qelphybox/ruby-tdlib-docker/blob/main/debian.Dockerfile)
- [`4.0-alpine`, `3.4-alpine`, `3.3-alpine`, `3.2-alpine`](https://github.com/qelphybox/ruby-tdlib-docker/blob/main/Dockerfile)
- [`4.0-slim`, `3.4-slim`, `3.3-slim`, `3.2-slim`](https://github.com/qelphybox/ruby-tdlib-docker/blob/main/debian.Dockerfile)
- [`4.0-bookworm`, `3.4-bookworm`, `3.3-bookworm`, `3.2-bookworm`](https://github.com/qelphybox/ruby-tdlib-docker/blob/main/debian.Dockerfile)

### Detailed Tag List

#### Ruby 4.0.0 (Latest)
- **Alpine**: `4.0.0-alpine`, `4.0-alpine`, `4-alpine`
- **Slim**: `4.0.0-slim`, `4.0-slim`, `4-slim`
- **Default (Trixie)**: `latest`, `4.0.0`, `4.0`, `4`

#### Ruby 3.4.8 / 3.4.7 / 3.4.6
- **Alpine**: `3.4.8-alpine`, `3.4.7-alpine`, `3.4.6-alpine`, `3.4-alpine`
- **Slim**: `3.4.8-slim`, `3.4.7-slim`, `3.4.6-slim`, `3.4-slim`
- **Bookworm**: `3.4.8-bookworm`, `3.4.7-bookworm`, `3.4.6-bookworm`, `3.4-bookworm`

#### Ruby 3.3.10
- **Alpine**: `3.3.10-alpine`, `3.3-alpine`
- **Slim**: `3.3.10-slim`, `3.3-slim`
- **Bookworm**: `3.3.10-bookworm`, `3.3-bookworm`

#### Ruby 3.2.9
- **Alpine**: `3.2.9-alpine`, `3.2-alpine`
- **Slim**: `3.2.9-slim`, `3.2-slim`
- **Bookworm**: `3.2.9-bookworm`, `3.2-bookworm`

> Note: All combinations above also support explicit OS version suffixes (e.g., `alpine3.23`, `trixie`) and TDLib version suffixes.

## What is Ruby TDLib Docker?

Ruby TDLib Docker provides minimal Docker images containing **Ruby**, **TDLib** (Telegram Database Library) **v1.8.35**, and necessary dependencies. These images are ready-to-use for running Ruby applications that depend on [tdlib-ruby](https://github.com/tdlib/tdlib-ruby) or building Telegram bots and clients.

TDLib is pre-compiled from commit `9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f` (v1.8.35), saving you significant build time.

## How to Use This Image

### Run an Interactive Shell

**Alpine version (Ruby 3.4):**
```bash
docker run --rm -it kirillbobykin/ruby-tdlib:3.4-alpine sh
```

**Slim version (Ruby 4.0):**
```bash
docker run --rm -it kirillbobykin/ruby-tdlib:4.0-slim bash
```

**Latest Stable (Ruby 4.0 + Trixie):**
```bash
docker run --rm -it kirillbobykin/ruby-tdlib:latest bash
```

### Use as Base Image

Create a `Dockerfile` in your project:

```dockerfile
# Choose your preferred version
FROM kirillbobykin/ruby-tdlib:3.4-alpine

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
    image: kirillbobykin/ruby-tdlib:3.4-alpine
    volumes:
      - .:/app
      # Persist TDLib session data
      - tdlib-session:/root/.tdlib-ruby
    working_dir: /app
    command: ruby app.rb

volumes:
  tdlib-session:
```

## Image Variants

### `alpine` (Recommended)

Based on the official `ruby:<version>-alpine`.
- **Size**: Smallest (~150MB).
- **Components**: Ruby, TDLib, musl libc.
- **Best for**: Production, efficiency, small footprint.

### `slim`

Based on the official `ruby:<version>-slim` (Debian Slim).
- **Size**: Medium.
- **Components**: Ruby, TDLib, glibc.
- **Best for**: Environments needing glibc compatibility but smaller size than full Debian.

### `bookworm` / `trixie`

Based on the official `ruby:<version>-bookworm` or `trixie` (Full Debian).
- **Size**: Largest.
- **Components**: Full Debian environment.
- **Best for**: Development, complex builds requiring many system libraries.

## Environment Variables

- `TDLIB_BUILD_PATH`: Path to TDLib build directory (default: `/tdlib/build`)

## Volumes

- `/root/.tdlib-ruby`: Recommended volume for TDLib session storage to persist data between restarts.

## TDLib Build Location

The TDLib build output is located at `/tdlib/build`. You can reference this path when configuring your Ruby application to use TDLib (e.g., configuring `tdlib-ruby` gem).

## License

This Docker image is licensed under the [MIT License](https://opensource.org/licenses/MIT).
- **TDLib**: [Boost Software License](https://github.com/tdlib/td/blob/master/LICENSE_1_0.txt).
- **Ruby**: [Ruby License](https://www.ruby-lang.org/en/about/license.txt).
