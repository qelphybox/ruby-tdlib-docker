# Ruby TDLib Docker

![Docker Image Version](https://img.shields.io/docker/v/kirillbobykin/ruby-tdlib)

Minimal Docker images containing Ruby, pre-compiled TDLib (v1.8.35), and necessary build dependencies.  
Ready-to-use for Ruby applications powered by [tdlib-ruby](https://github.com/tdlib/tdlib-ruby), Telegram bots, and clients.

## Supported Tags

Below is the complete list of supported tags, grouped by Ruby version.

All tags are available in two forms:
1. **Short** (e.g., `3.4-alpine`)
2. **With TDLib suffix** (e.g., `3.4-alpine-tdlib-1.8.35`) - guaranteed to contain specific TDLib version.

### Ruby 4.0.0 (Latest Stable)
- **Alpine**: `4.0.0-alpine`, `4.0-alpine`, `4-alpine`
- **Slim**: `4.0.0-slim`, `4.0-slim`, `4-slim`
- **Default (Trixie)**: `latest`, `4.0.0`, `4.0`, `4`

### Ruby 3.4
#### v3.4.8 (Latest 3.4)
- **Alpine**: `3.4.8-alpine`, `3.4-alpine`, `3-alpine`
- **Slim**: `3.4.8-slim`, `3.4-slim`, `3-slim`
- **Bookworm**: `3.4.8-bookworm`, `3.4-bookworm`, `3-bookworm`

#### v3.4.7
- **Alpine**: `3.4.7-alpine`
- **Slim**: `3.4.7-slim`
- **Bookworm**: `3.4.7-bookworm`

#### v3.4.6
- **Alpine**: `3.4.6-alpine`
- **Slim**: `3.4.6-slim`
- **Bookworm**: `3.4.6-bookworm`

### Ruby 3.3.10
- **Alpine**: `3.3.10-alpine`, `3.3-alpine`
- **Slim**: `3.3.10-slim`, `3.3-slim`
- **Bookworm**: `3.3.10-bookworm`, `3.3-bookworm`

### Ruby 3.2.9
- **Alpine**: `3.2.9-alpine`, `3.2-alpine`
- **Slim**: `3.2.9-slim`, `3.2-slim`
- **Bookworm**: `3.2.9-bookworm`, `3.2-bookworm`

> **Note**: Explicit OS version tags (e.g., `alpine3.23`, `trixie`) are also supported but omitted for brevity.

## Image Variants

| Variant | Base Image | Size | Use Case |
|---------|------------|------|----------|
| **Alpine** | `ruby:alpine` | ~150MB | **Production**, minimal footprint |
| **Slim** | `ruby:slim` (Debian) | Medium | Needs glibc, but smaller than full OS |
| **Bookworm** | `ruby:bookworm` | Large | Development, full system libraries |

## Features

- **TDLib Version**: `1.8.35` (commit `9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f`)
- **Pre-configured**: TDLib is compiled and ready at `/tdlib`.
- **Environment**: `TDLIB_BUILD_PATH=/tdlib/build`
- **Volume**: `/root/.tdlib-ruby` for session persistence.

## Usage

### Run
```bash
# Run latest stable
docker run --rm -it kirillbobykin/ruby-tdlib:latest bash

# Run specific version
docker run --rm -it kirillbobykin/ruby-tdlib:3.4-alpine sh
```

### Dockerfile
```dockerfile
FROM kirillbobykin/ruby-tdlib:3.4-alpine
WORKDIR /app
COPY . .
CMD ["ruby", "app.rb"]
```

### Docker Compose
```yaml
services:
  bot:
    image: kirillbobykin/ruby-tdlib:3.4-alpine
    volumes:
      - .:/app
      - tdlib-session:/root/.tdlib-ruby
    command: ruby bot.rb

volumes:
  tdlib-session:
```

---
**Maintained by [kirillbobykin](https://github.com/qelphybox).**
