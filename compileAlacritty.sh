#!/bin/bash

docker_build=false
docekr_run=false

if [ "$1" == --help ]; then
    echo -e "Obtendo ajuda:
    --help \t\t Obtêm ajuda.
    --ful \t\t Executa todos os passos.
    --enviroment \t Prepara o ambiente de compilação.
    --compile \t\t Clona o projeto e compila.
    "
fi

if [ "$1" == --full ]; then
    docker_build=true
    docekr_run=true
fi

if [ "$1" == --enviroment ]; then
    docker_build=true
fi

if [ "$1" == --compile ]; then
    docekr_run=true
fi

if [ "$docker_build" == true ];
then
    docker build -t compiler_alacritty  .
fi

if [ "$docekr_run" == true ];
then
    docker run -it -v .:/usr/src/work/ --rm --name running_compiler_alacritty compiler_alacritty /bin/bash -c 'rm -rf alacritty && git clone https://github.com/alacritty/alacritty.git && cd alacritty && cargo build --release --no-default-features --features=wayland'
fi