FROM debian:jessie
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442
RUN echo 'deb http://download.fpcomplete.com/debian jessie main' | \
    tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    curl bzip2 build-essential zlib1g nginx libpq-dev zlib1g-dev libgcrypt11-dev \
    postgresql libpq-dev git stack
RUN useradd -ms /bin/bash robot
RUN groupadd nixbld && usermod -a -G nixbld robot
ENV HOME /home/robot
RUN mkdir -p /nix /opt/yesod /opt/keter/incoming /opt/keter/etc /opt/yesod-nix-example $HOME/.nixpkgs && \
    chown -R robot /nix /opt/yesod /opt/keter /opt/yesod-nix-example $HOME/.nixpkgs
ENV USER robot
USER robot
WORKDIR /home/robot
RUN curl https://nixos.org/nix/install | sh
RUN . $HOME/.nix-profile/etc/profile.d/nix.sh && \
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable && \
    nix-channel --update
WORKDIR /opt/yesod-nix-example
RUN echo "{ allowunfree = true; }" > $HOME/.nixpkgs/config.nix
ADD stack.yaml haskell-yesod-example.cabal ./
RUN . $HOME/.nix-profile/etc/profile.d/nix.sh && stack setup
RUN . $HOME/.nix-profile/etc/profile.d/nix.sh && stack install --dependencies-only
