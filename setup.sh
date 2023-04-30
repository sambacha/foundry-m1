#!/usr/bin/env bash

if [[ "$OSTYPE" =~ ^darwin ]]; then

    brew_prefix=$(brew --prefix)
    if [[ $(uname -m) == 'arm64' ]]; then
      echo "** Running on a Apple Silicon M1"
      export expected_prefix=/opt/homebrew
      rustup default stable-aarch64-apple-darwin
    else
      echo "** Running on a Apple x86"
      export expected_prefix=/usr/local
    fi

    # Ensure that we have libgit2's dependencies installed.
    installed=$(brew list)

    REQUIRED_TOOLS="libusb, libgit2, libssh2, libiconv, libffi, gcc, gmp, gmake, perl5, llvm, xz, realpath"
    for tool in $REQUIRED_TOOLS
    do
        # Skip packages that are already installed.
        echo "$installed"
         grep -q "$tool" && code=$? || code=$?

        if [ "$code" -eq "0" ]
        then
            echo "*** $tool is available"
            continue
        elif [ "$code" -ne "1" ]
        then
            exit "$code"
        fi

        echo "*** Installing $tool with Homebrew..."
        brew install "$tool"

    done
fi

echo -e "Foundry setup OK"
