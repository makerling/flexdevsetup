#!/bin/bash

git clone git://github.com/sillsdev/fwmeta.git fwrepo
cd fwrepo

echo
echo "************************************************"
echo

#force usage of git bash version, version in folder doesn't work

#change only second instance
echo "changing second instance of if statement"
sed -i ':a;N;$!ba; s/if \[ \"$OSTYPE/##if \[ \"$OSTYPE/2' fwmeta/initrepo 
#using perl for multiline ease
echo "changing else and fi statement"
perl -i -p0e 's/else\n\tGETOPT=\"getopt\"\nfi/#else\n\tGETOPT=\"getopt\"\n#fi/igs' fwmeta/initrepo

echo
echo "************************************************"
echo

git add .
git commit -m "forcing initrepo script to use built-in GETOP, one in fwmeta folder not working on clean Win 10 machine"

echo
echo "************************************************"
echo

fwmeta/initrepo

read -n1 -r -p "initrepo script complete, press any key to close..." key
