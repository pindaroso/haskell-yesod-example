#!/bin/bash
curl https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh
nix-env -f "<nixpkgs>" -iA haskellPackages.cabal2nix
nix-env -f "<nixpkgs>" -iA haskellPackages.cabal-install
nix-env -f "<nixpkgs>" -iA haskellPackages.styx
styx configure
