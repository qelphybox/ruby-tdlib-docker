#!/bin/bash
set -e

# Required environment variables:
# - RUBY_VER (e.g., 4.0.0)
# - OS (e.g., trixie, alpine3.23)
# - VARIANT (e.g., default, slim)
# - IMAGE_NAME (e.g., kirillbobykin/ruby-tdlib)
# - TDLIB_VERSION (e.g., 1.8.35)
# - LATEST_RUBY (e.g., 4.0.0)
# - LATEST_OS (e.g., trixie)

# 1. Base Image & Dockerfile Determination
IFS='.' read -r MAJOR MINOR PATCH <<< "$RUBY_VER"
RUBY_MAJOR="$MAJOR"
RUBY_MINOR="$MAJOR.$MINOR"

BASE_TAG="${RUBY_VER}"
DOCKERFILE="debian.Dockerfile"

if [[ "$OS" == *"alpine"* ]]; then
  DOCKERFILE="Dockerfile"
  # Alpine has no slim variant here, just alpineX.XX
  BASE_TAG="${RUBY_VER}-${OS}"
else
  # Debian (Trixie/Bookworm)
  if [[ "$VARIANT" == "slim" ]]; then
    BASE_TAG="${RUBY_VER}-slim-${OS}"
  else
    BASE_TAG="${RUBY_VER}-${OS}"
  fi
fi

# Output for GitHub Actions
echo "base_image=ruby:${BASE_TAG}" >> $GITHUB_OUTPUT
echo "dockerfile=${DOCKERFILE}" >> $GITHUB_OUTPUT

# 2. Tag Generation
TAGS=()
SUFFIX="-tdlib-${TDLIB_VERSION}"

add_tag() {
  local tag=$1
  TAGS+=("${IMAGE_NAME}:${tag}${SUFFIX}")
  # Uncomment to add clean tags without tdlib suffix:
  TAGS+=("${IMAGE_NAME}:${tag}") 
}

# Basic aliases: 4.0.0, 4.0, 4
RUBY_ALIASES=("$RUBY_VER" "$RUBY_MINOR" "$RUBY_MAJOR")

# Determine OS suffix
OS_SUFFIX=""
if [[ "$OS" == *"alpine"* ]]; then
  OS_SUFFIX="-${OS}" # -alpine3.23
else
  if [[ "$VARIANT" == "slim" ]]; then
    OS_SUFFIX="-slim-${OS}"
  else
    OS_SUFFIX="-${OS}"
  fi
fi

# Generate combinations
for r_alias in "${RUBY_ALIASES[@]}"; do
  # Full tag: 4.0.0-trixie, 4.0-trixie, 4-trixie
  add_tag "${r_alias}${OS_SUFFIX}"
  
  # Short alias for Alpine (e.g., 4.0-alpine instead of 4.0-alpine3.23)
  if [[ "$OS" == *"alpine"* ]]; then
     # Only for the latest alpine version in our matrix (alpine3.23)
     if [[ "$OS" == "alpine3.23" ]]; then
        add_tag "${r_alias}-alpine"
     fi
  fi
  
  # Short alias for Debian (e.g., 4.0-slim instead of 4.0-slim-trixie)
  if [[ "$OS" == "${LATEST_OS}" ]]; then
     if [[ "$VARIANT" == "slim" ]]; then
       add_tag "${r_alias}-slim"
     else
       add_tag "${r_alias}" # Just 4.0.0, 4.0, 4
     fi
  fi
done

# 'latest' tag processing
if [[ "$RUBY_VER" == "${LATEST_RUBY}" && "$OS" == "${LATEST_OS}" && "$VARIANT" == "default" ]]; then
   add_tag "latest"
fi

# Join tags with comma and output
IFS=,
echo "tags=${TAGS[*]}" >> $GITHUB_OUTPUT

