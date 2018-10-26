#!/bin/bash
failed=no
for f in $(find . -name '*.scm')
    do 
    if scheme --quiet < $f
        then
        echo Passed $f
    else
        echo
        echo Failed test $f
        failed=yes
    fi
done

echo
echo '========================'
if [ $failed = no ]
then
    echo TESTS PASSED Yay!
else
    echo TESTS FAILED
fi
echo '========================'
