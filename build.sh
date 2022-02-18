#!/bin/bash

VERSION=`cat Dockerfile| grep ARDRversion | head -n 1 | awk -F '=' '{print $2}' | sed 's/"//g' | sed 's/ //g' `

docker build -t scor2k/ardor:$VERSION .
docker push scor2k/ardor:$VERSION 

