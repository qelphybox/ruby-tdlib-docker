FROM ruby:3-bookworm

RUN apt-get update && apt-get install -y \
    git \
    cmake \
    g++ \
    make \
    gperf \
    linux-libc-dev \
    libssl-dev \
    zlib1g-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clone TDLib repository and checkout specific commit
RUN git clone https://github.com/tdlib/td.git /tdlib \
    && cd /tdlib \
    && git checkout 9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && cmake --build .

ENV TDLIB_BUILD_PATH=/tdlib/build
VOLUME /root/.tdlib-ruby

CMD ["bash"]

