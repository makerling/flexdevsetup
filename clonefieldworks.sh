#!/bin/bash

git clone git://github.com/sillsdev/fwmeta.git fwrepo
cd fwrepo

echo
echo "************************************************"
echo

fwmeta/initrepo

read -n1 -r -p "initrepo script complete, press any key to close..." key
