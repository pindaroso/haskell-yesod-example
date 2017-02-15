{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, aeson, base, bytestring, case-insensitive
      , classy-prelude, classy-prelude-conduit, classy-prelude-yesod
      , conduit, containers, data-default, directory, fast-logger
      , file-embed, hjsmin, hspec, http-conduit, monad-control
      , monad-logger, safe, shakespeare, stdenv, template-haskell, text
      , time, unordered-containers, vector, wai, wai-extra, wai-logger
      , warp, yaml, yesod, yesod-core, yesod-form, yesod-static
      , yesod-test, perl, gmp, yesod-bin, cabal-install, foreign-store
      }:
      mkDerivation {
        pname = "yesod-nix-example";
        version = "0.0.0";
        src = ./.;
        isLibrary = true;
        isExecutable = true;
        configureFlags = [ "-fdev" "-flibrary-only" ];
        libraryHaskellDepends = [
          aeson base bytestring case-insensitive classy-prelude
          classy-prelude-conduit classy-prelude-yesod conduit containers
          data-default directory fast-logger file-embed hjsmin http-conduit
          monad-control monad-logger safe shakespeare template-haskell text
          time unordered-containers vector wai wai-extra wai-logger warp yaml
          yesod yesod-core yesod-form yesod-static perl gmp yesod-bin
          cabal-install foreign-store
        ];
        executableHaskellDepends = [ base ];
        testHaskellDepends = [
          aeson base classy-prelude classy-prelude-yesod hspec yesod
          yesod-core yesod-test
        ];
        license = stdenv.lib.licenses.unfree;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
