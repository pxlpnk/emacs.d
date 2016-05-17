#!/usr/bin/env bash

set -ex

echo emacs --version

emacs --load "./init.el" --script test.el
