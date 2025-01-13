#!/bin/bash

docker build -t compiler_alacritty  .
docker run -it -v .:/usr/src/work/ --rm --name running_compiler_alacritty compiler_alacritty /bin/bash -c 'git clone https://github.com/alacritty/alacritty.git && cd alacritty && cargo build --release --no-default-features --features=wayland'