#!/bin/bash
set -e

# Install package manager
sudo dnf install -y opam
opam init
eval $(opam env)

# Install OCaml
opam switch create 4.11.1

# Install REPL
opam install -y utop
