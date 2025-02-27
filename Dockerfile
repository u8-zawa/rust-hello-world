# ビルドステージ
FROM rust:1.76-slim-bookworm AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

# 実行ステージ
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/target/release/myapp .
CMD ["./myapp"]
