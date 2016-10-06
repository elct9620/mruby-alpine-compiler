#!/usr/bin/env sh

cd /build

# Clean exists build files
rm -rf ./bin/*
${MRUBY_PATH}/build/host/bin/mrbc -B _entrypoint -o ./dest/entrypoint.c ./src/*.rb
gcc -I${MRUBY_PATH}/include -c main.c -o ./dest/main.o
gcc ./dest/*.o ${MRUBY_PATH}/build/host/lib/*.a  -o ./bin/entrypoint
chmod +x ./bin/entrypoint
