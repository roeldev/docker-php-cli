#!/bin/sh

result="$( docker run ${image} php -m )"
echo ${result}
