#!/bin/sh

set -e

rm -rf install-tl-*
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xf install-tl-unx.tar.gz
