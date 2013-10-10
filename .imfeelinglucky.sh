#!/bin/bash
# we want to exit on errors
set -e

VIRTUALENV_BIN=`which virtualenv-2.7 || which virtualenv`
PYTHON=`which python2.7 || which python`
"$VIRTUALENV_BIN" --no-site-packages -p "$PYTHON" .

# Let's enter the virtualenv
. bin/activate

# Now we have
PYTHON=`which python2.7 || which python`

./bin/pip install --upgrade setuptools
ln -sf profiles/production.cfg buildout.cfg
$PYTHON bootstrap.py
./bin/buildout
./bin/fab component_buildout
