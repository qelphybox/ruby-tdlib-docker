FROM ruby:3.4.7-alpine3.22 AS tdlib-builder

RUN apk add --no-cache git cmake g++ make gperf linux-headers openssl-dev zlib-dev

# Clone TDLib repository and checkout specific commit
RUN git clone https://github.com/tdlib/td.git /tdlib \
    && cd /tdlib \
    && git checkout 9b6ff5863e5d0b2a07b50f4aa1a3344a51a1f80f \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && cmake --build .

RUN apk add --no-cache build-base

ENV TDLIB_BUILD_PATH=/tdlib/build
VOLUME /root/.tdlib-ruby

CMD ["sh"]

