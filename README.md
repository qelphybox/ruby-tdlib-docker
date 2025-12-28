# Ruby Tdlib Docker

![Docker Image Version](https://img.shields.io/docker/v/kirillbobykin/ruby-tdlib)

Docker images containing Ruby, pre-compiled TDLib (v1.8.35), and necessary build dependencies.  
Ready-to-use for Ruby applications powered by [tdlib-ruby](https://github.com/tdlib/tdlib-ruby), Telegram bots, and clients.

## Supported Versions

The project automatically builds images for multiple Ruby versions and OS variants.

| Ruby Version | OS Variants | Docker Tags Example |
|--------------|-------------|---------------------|
| **4.0.0** (Latest) | Alpine, Slim, Bookworm | `4.0-alpine`, `4.0-slim`, `4.0-trixie` |
| **3.4.8** | Alpine, Slim, Bookworm | `3.4-alpine`, `3.4-slim`, `3.4-bookworm` |
| **3.3.10** | Alpine, Slim, Bookworm | `3.3-alpine`, `3.3-slim`, `3.3-bookworm` |
| **3.2.9** | Alpine, Slim, Bookworm | `3.2-alpine`, `3.2-slim`, `3.2-bookworm` |

> All tags include a suffix with the TDLib version, e.g., `4.0-alpine-tdlib-1.8.35`.  
> Short aliases (like `latest`, `4.0`, `alpine`) are also available.

## Image Variants

### 1. Alpine (Recommended)
Based on Alpine Linux (3.22 / 3.23).  
- **Size**: Smallest (~150MB).
- **Use case**: Production environments, efficiency.
- **Tag format**: `ruby_ver-alpine-tdlib-ver` (e.g., `3.4-alpine-tdlib-1.8.35`)

### 2. Slim (Debian)
Based on Debian Slim.
- **Size**: Medium.
- **Use case**: If you need glibc or Debian packages but want a smaller image than full Debian.
- **Tag format**: `ruby_ver-slim-tdlib-ver` (e.g., `3.4-slim-tdlib-1.8.35`)

### 3. Bookworm / Trixie (Full Debian)
Based on standard Debian releases.
- **Size**: Largest.
- **Use case**: Development, or when you need a full suite of standard tools.
- **Tag format**: `ruby_ver-bookworm-tdlib-ver` (e.g., `3.4-bookworm-tdlib-1.8.35`)

## Features

- **TDLib Version**: `1.8.35` (commit `9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f`)
- **Pre-configured**: TDLib is compiled and ready at `/tdlib`.
- **Environment**: `TDLIB_BUILD_PATH` is set to `/tdlib/build`.
- **Volume**: `/root/.tdlib-ruby` defined for session persistence.

## Usage

### Run directly
```bash
# Run latest stable (Ruby 4.0 + Trixie)
docker run --rm -it kirillbobykin/ruby-tdlib:latest bash

# Run specific version (Ruby 3.4 on Alpine)
docker run --rm -it kirillbobykin/ruby-tdlib:3.4-alpine sh
```

### Docker Compose Example

```yaml
services:
  my-bot:
    image: kirillbobykin/ruby-tdlib:3.4-alpine-tdlib-1.8.35
    volumes:
      - .:/app
      # Persist TDLib session data
      - tdlib-session:/root/.tdlib-ruby
    command: ruby my_bot.rb

volumes:
  tdlib-session:
```

## Build Locally

You can build specific images locally using the `Makefile`.

```bash
# Build Alpine image
make build-image

# Build Slim image
make build-slim-image

# Build Bookworm image
make build-bookworm-image
```

## About TDLib

[TDLib](https://github.com/tdlib/td) (Telegram Database Library) is a cross-platform library for building Telegram clients.

---

**Maintained by [kirillbobykin](https://github.com/qelphybox).**
