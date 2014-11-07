#! /bin/bash
./build.sh
as functions.s -o functions.o
./i836-driver.sh $1