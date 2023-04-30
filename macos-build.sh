#!/bin/sh
RUSTFLAGS="-C link-arg=-fuse-ld=$PWD/ld64.lld -C target-cpu=native" cargo build --bins --release
