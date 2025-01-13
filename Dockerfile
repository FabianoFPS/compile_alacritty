FROM rust:1.84

WORKDIR /usr/src/work

RUN rustup override set stable && \
    rustup update stable

RUN apt update && \
    apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y


# Create a custom user with UID 1000 and GID 1000
# RUN groupadd -g 1000 customgroup && \
#     useradd -m -u 1000 -g customgroup customuser

# usar mesmo UID e GID do usuário do sistemas
USER 1000:1000

# RUN git clone https://github.com/alacritty/alacritty.git

# WORKDIR /usr/src/work/alacritty

# RUN cargo build --release --no-default-features --features=wayland
