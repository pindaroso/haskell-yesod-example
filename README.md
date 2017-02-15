# haskell-yesod-example

**Haskell Yesod Application Example with Stack and Nix Builds**

## Requirements

* Vagrant and Ansible or Docker and Docker Compose

## Setup

```bash
vagrant up
vagrant ssh -c "cd code && make"
```

### Notes

The `shell.nix` file was generated with `cabal2nix --shell . > shell.nix`. Then, the `default.nix` was generated via `cabal2nix . > default.nix`. Then, the `dev` and `library-only` flags were added to `configurationFlags`.

Questions or comments? Head over to [www.civiclabs.com](https://www.civiclabs.com) to get in touch with us.
