{ mkDerivation, aeson, base, bytestring, case-insensitive
, classy-prelude, classy-prelude-conduit, classy-prelude-yesod
, conduit, containers, data-default, directory, fast-logger
, file-embed, hjsmin, hspec, http-conduit, monad-control
, monad-logger, safe, shakespeare, stdenv, template-haskell, text
, time, unordered-containers, vector, wai, wai-extra, wai-logger
, warp, yaml, yesod, yesod-core, yesod-form, yesod-static
, yesod-test
}:
mkDerivation {
  pname = "yesod-nix-example";
  version = "0.0.0";
  src = ./.;
  configureFlags = [ "-fdev" "-flibrary-only" ];
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base bytestring case-insensitive classy-prelude
    classy-prelude-conduit classy-prelude-yesod conduit containers
    data-default directory fast-logger file-embed hjsmin http-conduit
    monad-control monad-logger safe shakespeare template-haskell text
    time unordered-containers vector wai wai-extra wai-logger warp yaml
    yesod yesod-core yesod-form yesod-static
  ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [
    aeson base classy-prelude classy-prelude-yesod hspec yesod
    yesod-core yesod-test
  ];
  license = stdenv.lib.licenses.unfree;
}
