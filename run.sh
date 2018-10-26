#!/bin/bash
for f in $(find . -name *.scm)
    do 
    if scheme --quiet < $f
        then
        echo Passed $f
    else
        echo
        echo Failed test $f
        break
    fi
done
