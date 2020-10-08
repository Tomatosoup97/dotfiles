#!/bin/bash
set -e

opam repo add coq-released https://coq.inria.fr/opam/released
opam repository add coq-released --set-default
opam install -y coq

sudo dnf install -y cairo-devel gtk3-devel gtksourceview3-devel
opam install -y coqide
