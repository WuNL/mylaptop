#!/bin/bash

for file in $(find . -name *.cpp~);
do echo $file;
    rm $file;
done;
