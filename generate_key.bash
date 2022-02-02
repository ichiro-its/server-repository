#!/bin/bash

sudo apt-get install gpg
gpg --full-generate-key
gpg --list-secret-key --with-subkey-fingerprint
