# Stage 1: Build the C application
FROM gcc:12 AS builder
WORKDIR /src
COPY src/hello.c .
RUN gcc -static -o app hello.c

# Stage 2: Create the final, lightweight image
FROM debian:bullseye-slim
COPY --from=builder /src/app /usr/local/bin/app
ENTRYPOINT ["app"]
