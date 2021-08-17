#!/bin/bash
set -e
gpg --yes -o keepassx-dotfiles.kdbx.gpg --recipient mu@qed.ai --encrypt keepassx-dotfiles.kdbx
