#!/bin/bash


if [[ "`uname`" == 'Darwin' ]] ; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
    _script="$(readlink -f ${BASH_SOURCE[0]})"
    DIR="$(dirname $_script)"
fi

echo $DIR

