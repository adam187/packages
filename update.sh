#!/bin/bash

if [[ "`uname`" == 'Darwin' ]] ; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
    _script="$(readlink -f ${BASH_SOURCE[0]})"
    DIR="$(dirname $_script)"
fi

GIT="$(which git)"
GITDIR="$DIR/.git"

# pull latest changes from repo
$GIT --git-dir=$GITDIR pull

# update packages
$DIR/vendor/bin/satis build $DIR/satis.json $DIR

# push changes to repo
$GIT --git-dir=$GITDIR --work-tree=$DIR add --verbose .
$GIT --git-dir=$GITDIR commit -m "update"
$GIT --git-dir=$GITDIR push
